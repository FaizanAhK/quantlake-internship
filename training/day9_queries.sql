-- DAY 9
-- List each customers with total orders and total revenue

SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(r.rental_id) AS total_orders,
    SUM(p.amount) AS total_revenue
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY c.customer_id;

-- Retrieve the top highest spending customers with their country names

SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    co.country,
    SUM(p.amount) AS total_spent
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 5;

-- List product categories and their total revenue using joins

SELECT 
    cat.name AS category,
    SUM(p.amount) AS total_revenue
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category cat ON fc.category_id = cat.category_id
GROUP BY cat.name
ORDER BY total_revenue DESC;


-- TASK - 2

-- For each customers rank their orders by order amount
SELECT 
    customer_id,
    payment_id,
    amount,
    RANK() OVER (PARTITION BY customer_id ORDER BY amount DESC) AS rank_ordered
FROM payment;

-- Calculate running total of sales by month

SELECT 
    DATE_FORMAT(payment_date, '%Y-%m') AS month,
    SUM(amount) AS monthly_sales,
    SUM(SUM(amount)) OVER (ORDER BY DATE_FORMAT(payment_date, '%Y-%m')) AS running_total
FROM payment
GROUP BY month;

-- Top 3 products per category by revenue

WITH product_revenue AS (
    SELECT 
        f.title,
        fc.category_id,
        cat.name AS category,
        SUM(p.amount) AS revenue
    FROM payment p
    JOIN rental r ON p.rental_id = r.rental_id
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film f ON i.film_id = f.film_id
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category cat ON fc.category_id = cat.category_id
    GROUP BY f.film_id, fc.category_id, cat.name
),
ranked_products AS (
    SELECT *,
        RANK() OVER (PARTITION BY category_id ORDER BY revenue DESC) AS rank_in_category
    FROM product_revenue
)
SELECT *
FROM ranked_products
WHERE rank_in_category <= 3;

-- TASK - 3 

-- COMMON TABLE EXPRESSION

--  1. CTE: Customers with average order value > ₹1000.

SELECT 
    customer_id,
    AVG(amount) AS avg_order
FROM payment
GROUP BY customer_id
ORDER BY avg_order DESC
LIMIT 10;

-- cte to filter last 3 months order then aggregate revenue

WITH recent_orders AS (
    SELECT *
    FROM payment
    WHERE payment_date >= '2005-11-14'  -- Adjusted for Sakila's max date
)
SELECT 
    customer_id,
    SUM(amount) AS revenue_last_3_months
FROM recent_orders
GROUP BY customer_id
ORDER BY revenue_last_3_months DESC;

-- TASK - 4

-- Business scenerio query
-- 1. Monthly sales trend table (product-wise)

SELECT 
    f.title,
    DATE_FORMAT(p.payment_date, '%Y-%m') AS month,
    SUM(p.amount) AS monthly_revenue
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
GROUP BY f.film_id, month
ORDER BY f.title, month;

-- 2. Identify products with decreasing monthly sales for the last 3 months.

WITH monthly_sales AS (
    SELECT 
        f.film_id,
        f.title,
        DATE_FORMAT(p.payment_date, '%Y-%m') AS sales_month,
        SUM(p.amount) AS monthly_revenue
    FROM payment p
    JOIN rental r ON p.rental_id = r.rental_id
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film f ON i.film_id = f.film_id
    GROUP BY f.film_id, sales_month
),
ranked_sales AS (
    SELECT *,
        RANK() OVER (PARTITION BY film_id ORDER BY sales_month DESC) AS month_rank
    FROM monthly_sales
)
SELECT 
    film_id, title,
    GROUP_CONCAT(monthly_revenue ORDER BY month_rank DESC) AS last_3_months_revenue
FROM ranked_sales
WHERE month_rank <= 3
GROUP BY film_id, title
HAVING 
    COUNT(*) = 3 AND
    MAX(monthly_revenue) > MIN(monthly_revenue) AND
    MAX(month_rank) = 3;
    

