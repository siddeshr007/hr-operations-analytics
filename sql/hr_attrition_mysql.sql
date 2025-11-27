-- Make sure we are in the right database
USE hr_operations;

-- (Run this ONCE after import to fix the Age column name)
-- If it already says Age in the Columns list, you can skip/comment this.
-- ALTER TABLE employees
-- CHANGE COLUMN `ï»¿Age` Age INT;

-- 1) Attrition rate by department
SELECT 
    Department,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) AS attrition_rate
FROM employees
GROUP BY Department
ORDER BY attrition_rate DESC;

-- 2) Attrition rate by job role
SELECT 
    JobRole,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) AS attrition_rate
FROM employees
GROUP BY JobRole
ORDER BY attrition_rate DESC;

-- 3) Attrition rate by age band
SELECT
    CASE 
        WHEN Age < 25 THEN '<25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS age_band,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) AS attrition_rate
FROM employees
GROUP BY age_band
ORDER BY attrition_rate DESC;

-- 4) Attrition rate by years at company
SELECT
    YearsAtCompany,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) AS attrition_rate
FROM employees
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany ASC;
