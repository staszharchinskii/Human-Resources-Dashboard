-- Questions

SHOW COLUMNS FROM HR;

-- 1. What is the gender breakdown of employees?

SELECT Sex, count(*) AS count
FROM HR
WHERE Age >= 18
GROUP BY Sex;

-- 2. What is the race/ethnicity breakdown of employees?

SELECT RaceDesc, count(*) AS count
FROM HR
WHERE Age >= 18
GROUP BY RaceDesc
ORDER BY count(*) DESC;

-- 3. What is the age distribution of employees?

SELECT 
  MIN(Age) AS Youngest,
  MAX(Age) AS Oldest
FROM HR
WHERE Age >= 18;

SELECT 
  CASE 
    WHEN Age >= 18 AND Age <= 24 THEN '18-24'
    WHEN Age >= 25 AND Age <= 34 THEN '25-34'
    WHEN Age >= 35 AND Age <= 44 THEN '35-44'
    WHEN Age >= 45 AND Age <= 54 THEN '45-54'
    ELSE '54+'  
  END AS Age_group, 
  count(*) AS count
FROM 
  HR
WHERE 
  Age >= 18
GROUP BY Age_group
ORDER BY Age_group;

-- 4. How does the gender distribution vary across departments?

SELECT Department, Sex, count(*) as count
FROM HR
WHERE Age >= 18
GROUP BY Department, Sex
ORDER BY Department;

-- 5. What is the distribution of recruitment sources?

SELECT RecruitmentSource, count(*) as count
FROM HR
WHERE Age >= 18
GROUP BY RecruitmentSource
ORDER BY count(*) DESC;

-- 6. What are the most common cases of termination?

SELECT TermReason, count(*) as count
FROM HR
WHERE Age >= 18
GROUP BY TermReason
ORDER BY count(*) DESC;

-- 7. What is the distribution of employees across locations by state?

SELECT State, count(*) as count
FROM HR
WHERE Age >= 18
GROUP BY State
ORDER BY count(*) DESC;