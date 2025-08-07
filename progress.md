# QuantLake Internship Progress Report

### Day 1


- Python/Jupyter Notebook already installed
- Understood Git and GitHub basics
- Created Github repo named 'quantlake-internship' with folders named 'trainings' and 'projects'.
- Inside training folder, created a python notebook named "day1_python_basics" and filled with instructions.


#### Progress Log

- I chose Jupyter Notebook for Python.
- Python and Anaconda/Jupyter Notebook already installed, no configuration as of now.
- I learnt about everyday workflow that happens in industries.
- Python basics
- Learned Git and GitHub
- The internship repo is live and well structured. 


### Day 2

#### Progress Log

- Practiced working with list, set, tuple, dict
   - Praciced List Comprehensions
   - Dictionary nesting and lookup
   - Functions and Modules like math,random, datetime
   - Learnt try, except, finally in python

- Prime Number felt hardest and factorial was the easiest

- Screenhot of the problem solved : List Sorting and Duplicate Removal

  <img src = "https://github.com/FaizanAhK/quantlake-internship/blob/main/images/Screenshot%202025-06-23%20184704.png">


### Day 3

#### Progress Log

##### Dataset Used : Titanic Dataset
##### Features Explored : Size & Shape of the Dataset, added and dropped columns etc.
##### 



## Day 4 Summary

- Practiced .loc and .iloc for slicing
- Cleaned missing data with dropna() and fillna()
- Grouped sales data by Region and Category
- Merged sample customer-order datasets using different join types


## Day 5 - Data Manipulation II

**Dataset Used**: Superstore Dataset (Kaggle)

### Reshaping Methods Practiced:
- `df.pivot(index, columns, values)` to reshape sales by Region and Category
- `df.pivot_table()` to calculate average profit per Segment
- `df.melt()` to convert wide format to long format for Category/Sub-Category

### Transformation Logic Implemented:
- Used `.apply()` with custom function to classify Profit as High/Medium/Low
- Flagged rows with discount > 90%
- Used `.map()` to convert Region to Region Code
- Replaced "Consumer" with "Retail" in Segment column

### DataFrame Combinations:
- Concatenated two DataFrames vertically with `ignore_index=True`
- Combined DataFrames with mismatched columns using `axis=1`

### Challenges & Workarounds:
- Dropped missing values before applying pivot
- Ensured consistent column formats before using `map()` and `replace()`

**Final Dashboard**: Pivot table showing Profit by Category and Region

### Day 6 — Data Visualization Summary

**Charts Learned**: Line Plot, Bar Chart, Histogram, Boxplot, Heatmap

**Visualized Features**:
- Sales distribution
- Profit by Region
- Quantity by Ship Mode
- Monthly Sales Trends

**Most Polished Chart**: 
- "Monthly Sales Trend" line plot.
- Clean labels, good color contrast, high resolution (DPI 300), and strong insight on sales peaks.

✅ All plots saved in GitHub as image files.


## Day 7 Progress

- ✅ DB Used: MySQL (Sakila)
- ✅ 5 Interesting Queries:
1. Top 10 rented films by count
2. Films released after 2005
3. Revenue grouped by staff_id
4. Active customers list
5. Films with 'PG' or 'G' rating


# Day 9 — Advanced SQL Analytics & Case-Based Queries

## 📌 Objective

Enhance SQL proficiency by applying advanced querying techniques including multi-table joins, window functions, common table expressions (CTEs), and solving business intelligence scenarios using the Sakila database.

---

## ✅ Tasks Completed

### 1. Multi-table Join Analysis
- **Customer orders and revenue**: Identified total orders and revenue per customer.
- **Top 5 spending customers**: Retrieved highest-paying customers along with their country.
- **Category revenue**: Summarized total revenue generated per product category.

### 2. Window Functions
- Used `RANK()` and `OVER()` clauses for:
  - Ranking customer orders by payment amount.
  - Calculating cumulative monthly sales (running total).
  - Ranking top 3 products by revenue within each category.

### 3. Common Table Expressions (CTEs)
- Found customers with **average order value > ₹1000** (simulated using FX rate).
- Aggregated revenue from the **last 3 months** of available data (static or dynamic date logic based on `MAX(payment_date)`).

### 4. Business Scenario Query
- Created a **monthly product-wise revenue table**.
- Identified **products with declining sales trends** over the last 3 months using CTEs and `RANK()`.

---

## 📊 Key Business Insights

- Certain customers (like ID 25, 63) are frequent high spenders and can be prioritized for loyalty programs.
- The **'Sports'** and **'Sci-Fi'** categories generate the highest revenue, indicating popular content demand.
- Some films show a clear **declining trend in monthly sales** — candidates for promotion or removal.
- Monthly sales trend is helpful for planning **inventory allocation** and marketing campaigns.




