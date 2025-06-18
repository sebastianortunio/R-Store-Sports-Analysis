#  Data Analysis in R – Sports Store Analytics
![image](https://github.com/user-attachments/assets/e0cc29cf-cd91-4034-893a-d283acfe1f79)


**Author:** Sebastián Ortuño

This project uses SQL to clean, transform, and analyze sales and customer data from a fictional sports store. The goal is to extract actionable business insights related to revenue, profit, customer ratings, and geographic trends.

---

## * Project Objectives

- Convert and clean date and rating fields
- Calculate key performance indicators (KPIs)
- Analyze profitability by sport and state
- Understand customer rating behavior
- Explore monthly profit trends

---

## * Dataset Overview

The project analyzes two tables:

- orders: Contains transaction-level data including revenue, profit, and rating.
- customers: Contains customer details including geographic location.

---

## * Data Cleaning Steps

- Converted `date` (text) to `Date_New` (DATE format)
- Replaced blank strings in `rating` with `NULL`
- Joined orders with customer data by `customer_id` for state-level insights

---

## * KPI Highlights

### 1. Overall Business Metrics

![image](https://github.com/user-attachments/assets/1f409c17-55f6-4817-91e5-0430fd5acb79)


### 2. KPIs by sport: revenue, profit, orders, profit margin.

---![image](https://github.com/user-attachments/assets/ff3312b0-6640-4171-93c2-49accccfe906)


- All sports are profitable, with Soccer, Baseball and Football performing the best.

---

## 3. Customer ratings: number, percentage of ratings from all orders, average rating.

- **Top Revenue States:** California, Texas, Florida
- **Top Margin States:** Utah, Massachusetts, New Mexico
- **Low Performers:** Maine, Rhode Island (low revenue and margin)
- **Hidden Gems:** Delaware, New Hampshire (high margins despite low volume)




## 4. Ratings distribution: number of orders by rating, revenue by rating, profit by rating, and profit margin by rating.

- Total Ratings: 1,193 from 2847 orders.
- % of Orders Rated: 41.91%
- Average Rating: 3.43 / 5

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



