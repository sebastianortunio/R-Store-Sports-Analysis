🏪 Store Sports Analysis (SQL Project)

This project explores sales performance for a fictional sports retail store using advanced SQL techniques to uncover business insights.


🔍 Key Objectives

Analyze total revenue, profit, and number of orders by sport.
Evaluate customer ratings and their impact on performance.
Track monthly profit trends.
Assess state-level performance based on revenue and profit.

🛠️ SQL Techniques Used

Aggregate Functions:
Used SUM(), COUNT(), and AVG() to calculate key metrics such as total revenue, profit, and average rating.
ROUND() was applied to improve result readability.
Window Functions:
ROW_NUMBER() ranked states by revenue, profit, and profit margin.
LAG() calculated month-over-month changes in profit to identify trends.
Date Conversion:
Used STR_TO_DATE() to convert string-formatted dates into SQL DATE types for accurate time-series analysis.
CTEs (Common Table Expressions):
Simplified complex logic, such as calculating the percentage of orders with customer ratings and average rating scores.
JOINS:
Combined orders and customers tables to analyze performance by state.

📈 Key Insights

Certain sports generated significantly higher profit margins than others.
States showed varied profitability, helping identify top-performing regions.
Monthly profit analysis revealed fluctuations, guiding seasonality or strategy shifts.
Only a portion of customers left ratings — yet these ratings correlated with key financial outcomes.
