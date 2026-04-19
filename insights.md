# 📊 Payment Card Fraud Detection 2025 – Insights

## 🗂 Dataset Overview

The dataset contains **2,133 transactions** and **2,133 unique customers**, indicating that each customer has made only one transaction.
This limits deep behavioral analysis such as repeat purchase patterns or customer lifecycle tracking.

---

## 💰 Revenue Insights

* The total purchase value is **372,451.82**, indicating strong overall revenue performance.
* The **average transaction value is 174.61**, suggesting moderate and consistent customer spending.
* There are no extreme outliers, which indicates a relatively stable purchasing pattern.

---

## 👥 Customer Insights

* Each customer appears only once in the dataset, restricting customer-level trend analysis.
* The **top 10 customers contribute the highest revenue**, making them important for targeted retention strategies.
* Customer loyalty tiers show **minimal variation in average spending**, indicating that the current loyalty program is not significantly influencing purchase behavior.

---

## 🛍 Product Insights

* **Serum** records the highest number of transactions, making it the most popular product category.
* Revenue distribution across product categories is relatively balanced, reducing dependency on a single category.
* Some categories (e.g., setting spray) show **higher value per transaction**, indicating premium positioning or higher pricing.

---

## 📍 Location Insights

* Transactions are distributed across multiple locations, indicating a geographically diverse customer base.
* Certain locations show higher transaction volumes, which may represent key markets for the business.

---

## ⚠️ Fraud Analysis

* Fraudulent transactions account for **3.09% of total transactions**, indicating low frequency but high financial risk.
* Fraud cases appear to be **isolated incidents**, as no customers were found with repeated fraud activity.
* This suggests that fraud may be opportunistic rather than systematic.

---

## ⏱ Time-Based Fraud Patterns

* Fraud transactions peak during **early morning hours**, a period typically associated with lower monitoring activity.
* This highlights the need for **time-based fraud detection controls** and enhanced monitoring during off-peak hours.

---

## 🔍 Advanced Fraud Detection Insights

### Rapid Transaction Behavior

* Time difference analysis between consecutive transactions helps identify unusually fast transactions.
* Such patterns may indicate suspicious or automated activity.

---

### High-Value Anomalies

* Transactions significantly higher than a customer’s average spending are flagged as potential anomalies.
* These deviations may indicate fraud or unusual purchasing behavior.

---

### Location Anomalies

* Sudden changes in customer location between transactions are identified as potential red flags.
* This may indicate account compromise or unauthorized access.

---

### IP Address Suspicion

* Changes in IP address between consecutive transactions are tracked.
* Frequent IP changes may signal suspicious login or fraudulent activity.

---

## 🧠 Customer Risk Profiling

* Customers are classified into:

  * **High Risk** (3 or more fraud cases)
  * **Medium Risk** (1–2 fraud cases)
  * **Low Risk** (no fraud cases)

* This segmentation helps in prioritizing fraud monitoring and preventive actions.

---

## 🏬 Store-Level Fraud Risk

* Stores are ranked based on fraud occurrences using ranking functions.
* **POPUP-MILAN** and **FLAGSHIP-PARIS** show the highest fraud activity (10 cases each).
* These locations require **stricter fraud control measures and monitoring systems**.

---

## 🔁 Repeat Fraud Analysis

* No customers were found with multiple fraud transactions.
* This indicates that fraud incidents are **not recurring per customer**, reducing the likelihood of repeat offenders.

---

## 🚀 Conclusion

This analysis provides key insights into:

* Customer purchasing behavior
* Product performance
* Fraud detection patterns

It enables businesses to:

* Strengthen fraud prevention strategies
* Improve customer targeting
* Optimize operational and monitoring processes

Overall, while fraud occurrence is low, its patterns highlight the importance of **proactive and time-sensitive monitoring systems**.
