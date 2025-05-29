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

| Metric             | Value           |
|--------------------|-----------------|
| Total Revenue      | $459,418.37     |
| Total Profit       | $284,821.86     |
| Number of Orders   | 2,845           |
| Profit Margin      | **62%**         |

### 🏅 Profitability by Sport

| Sport      | Revenue     | Profit     | Orders | Profit Margin |
|------------|-------------|------------|--------|----------------|
| Soccer     | $90,157.93  | $56,640.64 | 561    | 62.82%         |
| Football   | $94,768.32  | $59,328.90 | 572    | 62.60%         |
| Baseball   | $95,363.99  | $59,698.79 | 565    | 62.60%         |
| Basketball | $92,116.23  | $56,275.33 | 577    | 61.09%         |
| Hockey     | $87,011.90  | $52,878.20 | 572    | 60.77%         |

➡️ All sports are profitable, with Soccer and Football performing the best.

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

| Rating | Orders | Revenue   | Profit    | Margin   |
|--------|--------|-----------|-----------|----------|
| 5      | 297    | $40,565.93| $23,957.63| 59.06%   |
| 4      | 216    | $29,468.41| $17,303.72| 58.72%   |
| 3      | 240    | $38,663.38| $24,209.14| 62.62%   |
| 2      | 225    | $31,838.67| $19,250.57| 60.46%   |
| 1      | 215    | $28,596.75| $16,339.88| 57.14%   |

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



