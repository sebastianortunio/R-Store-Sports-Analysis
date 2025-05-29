/*

Data Analysis in SQL

Sebastian Ortuno
*/


-- In this project, I use SQL to analyze and clean data from a fictional sports store.
-- The goal is to answer key business questions and extract insights on revenue, profit,
-- customer ratings, and geographic trends.

------------------------------------------------------------------------------------------------------

-- Step 1: View the dataset to understand its structure

create database Store_Sports_Analytics;
use Store_Sports_Analytics;

select * from orders;
select * from customers;


-- Data Cleaning and Preparation Steps:
-- 1) Convert 'date' column (in text format) to a proper DATE type and store in 'Date_New'.
-- 2) Replace blank strings in the 'rating' column with NULL to enable aggregation.
-- 3) KPIs: total revenue, profit, number of orders, profit margin.
-- 4) KPIs by sport: revenue, profit, orders, profit margin.
-- 5) Customer ratings: number, the percentage of ratings the company got from all the orders, average rating.
-- 6) Ratings distribution: number of orders by rating, revenue by rating, profit by rating, and profit margin by rating.
-- 7) Revenue, profit, and profit margin by State.
-- 8) Monthly profit trends and comparison with previous month.

---------------------------------------------------------------------------------------------------------------------------------------------------------
-- 1) Convert 'date' column (in text format) to a proper DATE type and store in 'Date_New'.

-- Disable safe updates to allow changes.

set sql_safe_updates=0;

-- Add a new column with the correct DATE data type.

alter table orders 
add column Date_New date;

-- Populate the new column by converting the text to DATE format.
	
update orders
set Date_New= str_to_date(`date`,'%m/%d/%y');

-- Drop the old text-based date column.

alter table orders
drop column `date`;
-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 2) Replace blank strings in the 'rating' column with NULL to enable aggregation.

update orders
set rating= Null
where rating='';

----------------------------------------------------------------------------------------------------------------------------------------------------------
-- 3) KPIs: total revenue, profit, number of orders, profit margin.

select 
	   round(sum(revenue),2) as Revenue,
	   sum(profit) as Profit,
       count(order_id) as Number_of_orfers,
	 concat(round((sum(profit)/sum(revenue)),2)*100,'%') as Profit_Margin
From orders;

-- Revenue = $ 459,418.37
-- Profit= $284,821.86
--  Number of orders= 2845
-- Profit_Margin= 62%

-- Comment:
-- Strong profitability with a 62% profit margin across all orders.
----------------------------------------------------------------------------------------------------------------------------------------------------------
-- 4) KPIs by sport: revenue, profit, orders, profit margin.

select 
	   sport,
       round(sum(revenue),2) as Revenue,
	   round(sum(profit),2) as Profit,
       count(order_id) as Orders_per_Sport,
	round((sum(profit)/sum(revenue))*100,2) as Profit_Margin
From orders
GROUP BY sport;

-- Baseball:
-- Revenue=$95363.99, Profit=$59698.79, Profit Margin=62.6%, N. of orders=565

-- Basketball:
-- Revenue= $92116.23, Profit= $56275.33, Profit Margin=61.09%, N. of orders= 577

-- Hockey:
-- Revenue= $87011.9, Profit= $52878.2, Profit Margin=60.77%, N. of orders= 572

-- Football:
-- Revenue= $94768.32, Profit= $59328.9, Profit Margin= 62.6%, N. of orders= 572

-- Soccer:
-- Revenue= $90157.93, Profit= $56640.64, Profit Margin=. 62.82%, N. of orders= 561

-- Comment:

-- All sports have profit margins above 60%, which is a strong indicator of overall profitability.
-- Soccer has the highest margin, while Basketball has the highest order volume.
-- Football and Baseball show excellent balance between high revenue and strong margins.
-- Hockey, although slightly behind in margin, still performs well and could improve further with cost optimization.
----------------------------------------------------------------------------------------------------------------------------------

-- 5) Customer ratings: number, percentage of ratings from all orders, average rating.

-- We determine how many total orders we have to be able to get the percentage of rating from all the orders later.

select count(order_id)from orders;

-- We have a total of 2,847 orders.
-- With that information, we can now calculate all the required values for this problem.

with cte_ratings as 
(select avg(rating) as average_rating, 
		(select count(rating) 
		from orders 
		where rating is not null) as number_of_ratings
from orders 
where rating is not null)
select  number_of_ratings, 
		round((number_of_ratings/2847)*100,2) as Rating_Percentage, 
		round(average_rating,2)  as Average_Rating
from cte_ratings;



----------------------------------------------------------------------------------------------------------------------------------------------------------

-- 6) Ratings distribution: orders, revenue, profit, and profit margin by rating.


With cte_people_rating as 
(select rating, count(order_id) as Number_of_Orders,
		sum(revenue) as Revenue,
		sum(profit) as Profit,
        (sum(profit)/sum(revenue))*100 as profit_Margin
from orders
where rating is not null 
group by rating
order by rating desc)

select  rating, Number_of_Orders, 
		round(Revenue,2) as Revenue, 
		Round(profit,2) as profit, 	
		round (profit_Margin,2) as Profit_Margin
from cte_people_rating;

-- Rating= 5, Number of orders= 297, Revenue= $40565.93 ,Profit=$23957.63 , Profit Margin= 59.06%
-- Rating= 4, Number of orders= 216, Revenue= $29468.41 ,Profit=$17303.72 , Profit Margin= 58.72%
-- Rating= 3, Number of orders= 240, Revenue= $38663.38 ,Profit=$24209.14 , Profit Margin= 62.62%
-- Rating= 2, Number of orders= 225, Revenue= $31838.67 ,Profit=$19250.57 , Profit Margin= 60.46%
-- Rating= 1, Number of orders= 215, Revenue= $28596.75 ,Profit=$16339.88 , Profit Margin= 57.14%


-- Comment:
--  Rating 3 shows the highest profit margin (62.62%) despite not having the most orders.  
--  Rating 5 leads in revenue and profit, but with a lower margin (59.06%).  
--  Lower ratings (1–2) have the lowest margins, indicating potential customer dissatisfaction.  
--  No direct correlation between higher rating and better profitability.

----------------------------------------------------------------------------------------------------------------------------------------------------------

-- 7) Analyze revenue, profit, and profit margin by state.
select * from orders;
select * from customers;

with CTE_State as
(select c.State as State, 
		round(sum(o.revenue),2) as Revenue, 
        round(sum(o.profit),2) as Profit, 
        round((sum(o.profit)/sum(o.revenue))*100,2) as Profit_Margin
from orders o
join customers c
on o.customer_id=c.customer_id
group by c.State)
select State,
		Revenue,
		row_number()over(order by Revenue desc) as Rank_Revenue,
        Profit,
        row_number()over(order by Profit desc) as Rank_Profit,
        Profit_Margin,
        row_number()over(order by Profit_Margin desc) as Profit_Margin
from CTE_State;

-- Comments:
-- Utah, Massachusetts, and New Mexico have the best profit efficiency.
-- California, Texas, and Florida rank highest in both Revenue and Profit, but not in margin.
-- Maine and Rhode Island are at the bottom in all three metrics: least profitable and least revenue.
-- Smaller states like Delaware and New Hampshire show high margins despite lower total revenue.
----------------------------------------------------------------------------------------------------------------------------------------------------------
-- 8) Monthly profit trends and month-over-month comparisons.	

with CTE_Monthly_report as
(
select month(Date_New) as `Month`, 
		 sum(Profit) as Monthly_Profit
from orders
group by `Month`)
Select `Month`, Monthly_Profit, lag(Monthly_Profit)over(order by `Month`) as Previous_Month,
Monthly_Profit-lag(Monthly_Profit)over(order by `Month`) as Previous_Month_vs_Current_Month
from CTE_Monthly_report
;


-- Every month shows a positive profit — no losses were recorded.
-- March and April show the highest profit increases compared to the previous month: +7091.26 and +22795.24 respectively.
-- July had the largest drop in profit: -11251.86.
-- December shows recovery with a +6807.34 increase after prior declines.

---------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
---------------------------------------------------------------------------------------------------------------------------------------------------------------
FINAL CONCLUSION – SQL PROJECT
---------------------------------------------------------------------------------------------------------------------------------------------------------------

This SQL project showcases how raw transactional and customer data 
can be cleaned and analyzed to drive business decisions.

* Key Insights:
- Strong overall profit margin of 62%.
- Soccer and Football are the most profitable sports.
- California and Texas generate the highest revenue.
- Utah and Massachusetts have the most efficient profit margins.
- Customer satisfaction (ratings) does not always align with profit margins.
- Monthly profit remains consistently positive, with March and April showing peak gains.

* Business Implication:
The business is highly profitable with opportunities for further growth by:
1. Improving customer satisfaction in lower-rated orders.
2. Focusing marketing on high-margin states and sports.
3. Using monthly trends to plan seasonal inventory and campaigns.

This analysis demonstrates practical SQL skills in data cleaning, transformation, aggregation, and insight generation.

                              Thanks a lot for taking the time to check out my project! I hope you liked it.
---------------------------------------------------------------------------------------------------------------------------------------------------------------
*/
