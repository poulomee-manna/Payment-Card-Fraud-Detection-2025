-- ==============================
-- Data Preparation
-- ==============================

RENAME TABLE tran TO transactions;

ALTER TABLE transactions
CHANGE ï»¿Transaction_ID Transaction_ID text;

-- ==============================
-- Basic Analysis
-- ==============================

-- Total number of transactions
SELECT COUNT(*) AS total_transactions
FROM transactions;

-- Total purchase amount
SELECT SUM(Purchase_Amount) AS total_purchase
FROM transactions;

-- Average purchase amount
SELECT ROUND(AVG(Purchase_Amount), 2) AS avg_purchase
FROM transactions;

-- Number of unique customers
SELECT COUNT(DISTINCT Customer_ID) AS unique_customers
FROM transactions;

-- Transactions per day
SELECT 
    Transaction_Date,
    COUNT(Transaction_ID) AS no_of_transactions
FROM transactions
GROUP BY Transaction_Date
ORDER BY Transaction_Date;


-- ==============================
-- Product & Customer Analysis
-- ==============================

-- Transactions by product category
SELECT 
    Product_Category,
    COUNT(*) AS no_of_transactions
FROM transactions
GROUP BY Product_Category
ORDER BY no_of_transactions DESC;

-- Top 10 customers by total spending
SELECT 
    Customer_ID,
    SUM(Purchase_Amount) AS total_spending
FROM transactions
GROUP BY Customer_ID
ORDER BY total_spending DESC
LIMIT 10;

-- Top 5 product categories by revenue
SELECT 
    Product_Category,
    ROUND(SUM(Purchase_Amount), 2) AS revenue
FROM transactions
GROUP BY Product_Category
ORDER BY revenue DESC
LIMIT 5;

-- Transactions by location
SELECT 
    Location,
    COUNT(*) AS no_of_transactions
FROM transactions
GROUP BY Location;

-- Average purchase amount by loyalty tier
SELECT 
    Customer_Loyalty_Tier,
    ROUND(AVG(Purchase_Amount), 2) AS avg_purchase
FROM transactions
GROUP BY Customer_Loyalty_Tier;


-- ==============================
-- Fraud Analysis
-- ==============================

-- Fraud vs non-fraud transaction count
SELECT 
    CASE 
        WHEN Fraud_Flag = 0 THEN 'Non-Fraud'
        ELSE 'Fraud'
    END AS fraud_status,
    COUNT(*) AS no_of_transactions
FROM transactions
GROUP BY Fraud_Flag
    when Fraud_Flag = 0 then 'non-fraud'
    else 'fraud'
 end;

-- Fraud percentage
SELECT 
    CASE 
        WHEN Fraud_Flag = 1 THEN 'Fraud'
        ELSE 'Non-Fraud'
    END AS status,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM transactions
GROUP BY Fraud_Flag;


-- ==============================
-- Advanced Fraud Detection
-- ==============================

-- Rapid transaction detection
SELECT 
    Transaction_ID,
    Customer_ID,
    Transaction_Time,
    LAG(Transaction_Time) OVER (PARTITION BY Customer_ID ORDER BY Transaction_Time) AS prev_transaction_time,
    TIMESTAMPDIFF(
        MINUTE,
        LAG(Transaction_Time) OVER (PARTITION BY Customer_ID ORDER BY Transaction_Time),
        Transaction_Time
    ) AS time_diff_minutes
FROM transactions;

-- High-value anomaly detection
SELECT 
    Customer_ID,
    Purchase_Amount,
    AVG(Purchase_Amount) OVER (PARTITION BY Customer_ID) AS avg_purchase,
    Purchase_Amount - AVG(Purchase_Amount) OVER (PARTITION BY Customer_ID) AS difference
FROM transactions;

-- Location anomaly detection
SELECT *
FROM (
    SELECT 
        Customer_ID,
        Location,
        LAG(Location) OVER (PARTITION BY Customer_ID ORDER BY Transaction_Time) AS prev_location
    FROM transactions
) t
WHERE prev_location <> Location;

-- IP address anomaly detection
SELECT *
FROM (
    SELECT 
        Customer_ID,
        IP_Address,
        Location,
        LAG(IP_Address) OVER (PARTITION BY Customer_ID ORDER BY Transaction_Time) AS prev_ip_address
    FROM transactions
) t
WHERE prev_ip_address <> IP_Address;

-- Time-based fraud pattern
SELECT 
    HOUR(Transaction_Time) AS txn_hour,
    COUNT(*) AS fraud_count
FROM transactions
WHERE Fraud_Flag = 1
GROUP BY txn_hour
ORDER BY fraud_count DESC;

-- Customer risk profiling
SELECT 
    Customer_ID,
    SUM(Fraud_Flag) AS fraud_count,
    SUM(Purchase_Amount) AS total_purchase,
    CASE
        WHEN SUM(Fraud_Flag) >= 3 THEN 'High-Risk'
        WHEN SUM(Fraud_Flag) BETWEEN 1 AND 2 THEN 'Medium-Risk'
        ELSE 'Low-Risk'
    END AS risk_profile
FROM transactions
GROUP BY Customer_ID
ORDER BY fraud_count DESC;

-- Store-wise fraud ranking
SELECT 
    Store_ID,
    SUM(Fraud_Flag) AS total_fraud,
    DENSE_RANK() OVER (ORDER BY SUM(Fraud_Flag) DESC) AS rank_store
FROM transactions
GROUP BY Store_ID;

-- Repeat fraud customers
SELECT 
      Customer_ID,
    COUNT(*) AS fraud_count
FROM transactions
WHERE Fraud_Flag = 1
GROUP BY Customer_ID
HAVING COUNT(*) > 1;
