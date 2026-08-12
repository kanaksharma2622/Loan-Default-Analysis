-- =====================================================
-- LOAN DEFAULT ANALYSIS
-- SQL PROJECT
-- =====================================================

-- Create database
CREATE DATABASE loan_default_project;

-- Select database
USE loan_default_project;


-- =====================================================
-- 1. DATA INSPECTION
-- =====================================================

SELECT *
FROM loan_default
LIMIT 10;


-- =====================================================
-- 2. DEFAULT RATE BY REGION
-- =====================================================

SELECT
    region,
    ROUND(
        SUM(CASE WHEN Status = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS default_rate
FROM loan_default
GROUP BY region
ORDER BY default_rate DESC;


-- =====================================================
-- 3. CREDIT SCORE SUMMARY
-- =====================================================

SELECT
    MIN(Credit_Score) AS min_score,
    MAX(Credit_Score) AS max_score,
    AVG(Credit_Score) AS avg_score
FROM loan_default;


-- =====================================================
-- 4. DEFAULT RATE BY CREDIT SCORE CATEGORY
-- =====================================================

SELECT
    CASE
        WHEN Credit_Score BETWEEN 500 AND 650 THEN 'Low'
        WHEN Credit_Score BETWEEN 651 AND 750 THEN 'Medium'
        ELSE 'High'
    END AS credit_category,

    ROUND(
        SUM(CASE WHEN Status = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS default_rate

FROM loan_default

GROUP BY credit_category
ORDER BY default_rate DESC;


-- =====================================================
-- 5. DEFAULT RATE BY GENDER
-- =====================================================

SELECT
    Gender,
    ROUND(
        SUM(CASE WHEN Status = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS default_rate
FROM loan_default
GROUP BY Gender
ORDER BY default_rate DESC;


-- =====================================================
-- 6. DEFAULT RATE BY LOAN PURPOSE
-- =====================================================

SELECT
    loan_purpose,
    ROUND(
        SUM(CASE WHEN Status = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS default_rate
FROM loan_default
GROUP BY loan_purpose
ORDER BY default_rate DESC;


-- =====================================================
-- 7. DEFAULT RATE BY BUSINESS / COMMERCIAL STATUS
-- =====================================================

SELECT
    business_or_commercial,
    ROUND(
        SUM(CASE WHEN Status = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS default_rate
FROM loan_default
GROUP BY business_or_commercial
ORDER BY default_rate DESC;


-- =====================================================
-- 8. DEFAULT RATE BY APPROVAL STATUS
-- =====================================================

SELECT
    approv_in_adv,
    ROUND(
        SUM(CASE WHEN Status = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS default_rate
FROM loan_default
GROUP BY approv_in_adv
ORDER BY default_rate DESC;
