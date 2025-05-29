#  Data Analysis in SQL – Sports Store Analytics

**Author:** Sebastián Ortuño

This project uses SQL to clean, transform, and analyze sales and customer data from a fictional sports store. The goal is to extract actionable business insights related to revenue, profit, customer ratings, and geographic trends.

---

## 📌 Project Objectives

- Convert and clean date and rating fields
- Calculate key performance indicators (KPIs)
- Analyze profitability by sport and state
- Understand customer rating behavior
- Explore monthly profit trends

---

## 🗃️ Dataset Overview

The project analyzes two tables:

- `orders`: Contains transaction-level data including revenue, profit, and rating.
- `customers`: Contains customer details including geographic location.

---

## 🧹 Data Cleaning Steps

- Converted `date` (text) to `Date_New` (DATE format)
- Replaced blank strings in `rating` with `NULL`
- Joined orders with customer data by `customer_id` for state-level insights

---

## 📊 KPI Highlights

### 🧾 Overall Business Metrics

![image](https://github.com/user-attachments/assets/1f409c17-55f6-4817-91e5-0430fd5acb79)


### 🏅 Profitability by Sport

![image](https://github.com/user-attachments/assets/f382f9a7-9dd8-47bb-94b9-ffca643bf861)


➡️ All sports are profitable, with Soccer, Baseball and Football performing the best.

---

## 🌎 Geographic Insights

- **Top Revenue States:** California, Texas, Florida
- **Top Margin States:** Utah, Massachusetts, New Mexico
- **Low Performers:** Maine, Rhode Island (low revenue and margin)
- **Hidden Gems:** Delaware, New Hampshire (high margins despite low volume)

---

## ⭐ Customer Ratings

- Total Ratings: 1,193
- % of Orders Rated: 41.91%
- Average Rating: 3.43 / 5

**Rating Distribution vs Profitability:**

![image](https://github.com/user-attachments/assets/1324c3fe-b7a8-4641-90c4-3817e53987c3)


➡️ High ratings do not guarantee higher margins. Rating 3 has the highest profit margin.

---

## 📅 Monthly Profit Trends

- All months are profitable.
- March (+$7,091.26) and April (+$22,795.24) show the largest gains.
- July saw the biggest drop: −$11,251.86.
- December rebounded with +$6,807.34.

---

## 📈 Business Conclusions

- The company is **highly profitable**, with consistent positive profit margins.
- Focus areas:
  1. **Improve low-rated customer experiences**
  2. **Invest in high-margin states and sports**
  3. **Leverage monthly trends for better inventory planning**

---

## 💡 Final Thoughts

This project demonstrates practical SQL skills in:

- Data cleaning and transformation
- KPI calculation
- Aggregation and trend analysis
- Business interpretation of data

---

Thanks a lot for checking out my project!  
**Connect with me on [LinkedIn](https://www.linkedin.com/in/sebastian-ortuno/) or check out my other projects!**



