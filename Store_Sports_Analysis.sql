create database Store_Sports_Analytics;
use Store_Sports_Analytics;

select * from orders;
select * from customers;
----------------------------------------------------------------------------------------------------------------------------------------------------------
# KPI's for total revenue, profit, number of orders, profit margin

Select sum(revenue) as total_revenue, 
sum(profit) as total_profit,
count(*) as total_orders,
(sum(profit)/sum(revenue))*100 as profit_margin
from orders
order by total_revenue desc;
----------------------------------------------------------------------------------------------------------------------------------------------------------
# KPI's for total revenue, profit, number of orders, profit margin

Select sport, 
round( sum(revenue),2) as total_revenue, 
round(sum(profit),2) as total_profit,
count(order_id) as total_orders,
round((sum(profit)/sum(revenue))*100,2) as profit_margin
from orders
group by sport
order by total_profit desc;
----------------------------------------------------------------------------------------------------------------------------------------------------------

# 3 Number of customer rating, the perecetage of ratings the company got from all the orders, and the average rating

set sql_safe_updates=0;

update orders
set rating=NULL
where rating="";

with cte_rating_percentage as 
(select count(*) as total_ratings_available, round(avg(rating),2) as average_rating, sum(rating) as total_rating
from orders
where rating is not null)
select total_ratings_available, 
round((total_ratings_available/2847)*100,2) as percentage_gave_rate  , # 2847 is the total of orders in the company
 average_rating
from cte_rating_percentage;
----------------------------------------------------------------------------------------------------------------------------------------------------------
 # Number of people for each rating and its revenue, profit, profit margin

select rating, 
	round(sum(revenue),2) as revenue,
    round(sum(profit),2) as profit,
    round((sum(profit)/sum(revenue))*100,2) as profit_margin
from orders
where rating is not null
group by rating
order by rating desc;

----------------------------------------------------------------------------------------------------------------------------------------------------------
# State revenue, profit, profit margin

select round(sum(o.revenue),2) as revenue , 
row_number() over(order by sum(o.revenue) desc) rank_revenue,
round(sum(o.profit),2) as profit, 
row_number() over(order by sum(o.profit) desc) rank_profit,
round((sum(o.profit)/sum(o.revenue))*100,2) as profit_margin,
row_number()over(order by sum(o.profit)/sum(o.revenue)*100 desc) rank_profit_margin,
c.State
from orders o
join customers c
on o.customer_id=c.customer_id
group by c.State
order by profit desc;

----------------------------------------------------------------------------------------------------------------------------------------------------------
#First we converted date from string function to date to calculate monthly profit.

select str_to_date(date,"%m/%d/%y") as converted_table
from orders;

alter table orders
add date_converted date;

update orders
set date_converted=str_to_date(date,"%m/%d/%y");

select * from orders;


# Monthly Profit

with cte_profit as (select month(date_converted) as month,
	round(sum(profit),2) as monthly_profit
from orders
group by month
order by month)
select month, 
	monthly_profit, 
	lag(monthly_profit)over(order by month) as previous_month,
    monthly_profit-lag(monthly_profit) over  (order by month) as profit_difference
from cte_profit
order by month
;
