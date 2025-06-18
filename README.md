#  Data Analysis in R – Sports Store Analytics
![image](https://github.com/user-attachments/assets/e0cc29cf-cd91-4034-893a-d283acfe1f79)


**Author:** Sebastián Ortuño

In this project, I use R to analyze and clean data from an online sports store. The goal is to answer key business questions and extract insights on revenue, profit, customer ratings, and geographic trends.

Additionally, I created an interactive Tableau dashboard to gain a deeper understanding of the data. You can explore it here:  
https://public.tableau.com/app/profile/sebastian.ortuno.barrero/viz/SportsSalesCustomerAnalysis/RatingsDashboard?publish=y


---

## * Project Objectives

- 1) Convert 'date' column (in text format) to a proper DATE type and store in 'Date_New'.
- 2) KPIs: total revenue, profit, number of orders, profit margin.
- 3) KPIs by sport: revenue, profit, orders, profit margin.
- 4) Customer ratings: number, the percentage of ratings the company got from all the orders, average rating.
- 5) Ratings distribution: number of orders by rating, revenue by rating, profit by rating, and profit margin by rating.
- 6) Revenue, profit, and profit margin by State.
- 7) Monthly profit trends and comparison with previous month.
- 8) Monthly revenue trends and comparison with previous month.


---

## * Dataset Overview

The project uses two tables: **orders** and **customers**.

- **orders**: 2,847 rows, 8 columns — `order_id`, `customer_id`, `sport`, `revenue`, `profit`, `shipping_cost`, `rating`, `date`.

- **customers**: 2,847 rows, 4 columns — `customer_id`, `full_name`, `email`, `state`.

---

## * Data Cleaning Steps

- **Date column**:  
  - Converted `date` to `Date` format → `New_date`  
  - Reordered columns, replacing `date` with `New_date`

- **Month column**:  
  - Extracted and labeled month names from `New_date` as `Month_trend`  
  - Grouped by month to calculate total monthly profit
---

## * KPI Highlights

### 1. Overall Business Metrics

![image](https://github.com/user-attachments/assets/fe7af88c-dca2-4d75-bd28-cff14f0238ef)


Summary of the store’s overall performance:

- **Total Revenue:** $459,418.40  
  The store generated nearly half a million in total sales — strong revenue.

- **Total Profit:** $284,821.90  
  Profit makes up a significant portion of revenue, indicating healthy operations.

- **Number of Orders:** 2,847  
  Each order generates approximately $161.35 in revenue *(459,418.4 ÷ 2,847)*.

- **Profit Margin:** 62%  
  A very healthy margin — over half of each dollar earned is profit, which is excellent for retail.





### 2. KPIs by sport: revenue, profit, orders, profit margin.

![image](https://github.com/user-attachments/assets/099dcfc4-d5af-451d-9d2e-7a25ab9666fe)


![image](https://github.com/user-attachments/assets/dd2c8bf5-3255-4307-87f9-301a28640103)





- All sports have profit margins above 60%, indicating strong overall profitability.  
- Soccer has the highest profit margin, while Basketball leads in order volume.  
- Football and Baseball show a strong balance between high revenue and solid margins.  
- Hockey, though slightly lower in margin, performs well and could improve with cost optimization.  
- Order volumes are relatively consistent across all sports categories.

**Recommendation:**  
Reallocate marketing resources to Hockey and Baseball to boost volume, leveraging their growth potential. Also, review Basketball’s pricing and cost structure to improve margins without reducing sales volume.

---

## 3. Customer ratings: number, percentage of ratings from all orders, average rating.

![image](https://github.com/user-attachments/assets/9f3f53b8-12a4-4976-9279-b2a7e3492ea4)


- **Average Rating:** 3.13  
  The average customer rating across all orders is 3.13 out of 5, indicating moderate satisfaction.

- **Total Ratings Submitted:** 1,193  
  Out of 2,847 total orders, 1,193 included a customer rating.

- **Percentage of Orders with Ratings:** 41.9%  
  Only 41.9% of customers submitted ratings, suggesting opportunities to increase feedback.

**Recommendation:**  
Implement post-purchase incentives like small discounts, loyalty points, or thank-you emails to encourage more customers to leave ratings. Increased feedback will help improve products and services.




## 4. Ratings distribution: number of orders by rating, revenue by rating, profit by rating, and profit margin by rating.
![image](https://github.com/user-attachments/assets/af2e03ad-3296-49e5-9297-dd97d106f714)


- **High number of unrated orders:**  
  Most orders (1,654) lack customer ratings, showing many customers do not provide feedback.

- **Unrated orders drive highest revenue and profit:**  
  These orders generate over $290K in revenue and $183K in profit — the largest share overall.

- **Highest profit margin comes from unrated orders (63.30%):**  
  Followed by rating 3 orders at 62.62%, and rating 2 at 60.46%.

- **Profit margins don’t increase consistently with rating:**  
  Orders rated 3 have higher profit margins than those rated 4 and 5, which is unexpected.

**Recommendation:**  
Investigate product categories and pricing by rating to understand these trends better and improve strategies for collecting customer feedback.


**Rating Distribution vs Profitability:**

![image](https://github.com/user-attachments/assets/1324c3fe-b7a8-4641-90c4-3817e53987c3)


- High ratings do not guarantee higher margins. Rating 3 has the highest profit margin.

---
## 5. Analyze revenue, profit, and profit margin by state.






---
## 6. Monthly Profit Trends

![image](https://github.com/user-attachments/assets/048dc8c2-7448-4660-8e42-7bbfe20d9f45)





- Every month shows a positive profit — no losses were recorded.
- March and April show the highest profit increases compared to the previous month: +7091.26 and +22795.24 respectively.
- July had the largest drop in profit: -11251.86.
- December shows recovery with a +6807.34 increase after prior declines.
---
## 7. Monthly Revenue trends
![image](https://github.com/user-attachments/assets/098044af-f669-4b8a-ace9-95a84d77742e)





---

## 6. Business Conclusions

- The company is **highly profitable**, with consistent positive profit margins.
- Focus areas:
  1. **Improve low-rated customer experiences**
  2. **Invest in high-margin states and sports**
  3. **Leverage monthly trends for better inventory planning**

---



