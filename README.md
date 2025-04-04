# Store-Sports-Analysis

In this project, several SQL functions were used to process and analyze the data. Aggregate functions like SUM() and COUNT() were employed to calculate the total revenue, profit, and number of orders. The AVG() function was used to calculate the average rating, while ROUND() was applied to make numerical results, such as revenue, profit, and profit margins, more readable.

Window functions, like ROW_NUMBER(), were used to rank states based on their revenue or profit, and LAG() helped calculate the difference between the current month’s profit and the previous month’s profit, aiding in the analysis of monthly profit trends.

String-to-date functions like STR_TO_DATE() were used to convert date strings into proper date types for easier manipulation and comparison. This is crucial for calculating monthly profit changes and tracking trends over time.

Conditional expressions, such as IFNULL(), are commonly used to replace null values with a default, though it wasn't explicitly mentioned in the queries. Subqueries and Common Table Expressions (CTEs) were used to simplify complex queries and break down the logic. For instance, CTEs calculated the average rating and the percentage of customers who provided ratings.

Finally, JOIN statements were used to combine data from multiple tables. This was especially useful when linking the orders table with the customers table to analyze state-based revenue and profit.

Overall, these functions enabled in-depth analysis and manipulation of the data, allowing the store’s performance to be tracked across various dimensions, including sports, states, and time periods.
