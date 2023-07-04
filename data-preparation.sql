CREATE DATABASE HumanResources;
USE HumanResources;

SELECT * FROM HR;

-- Change column name from 'п»їEmployee_Name' to 'Employee_Name'
ALTER TABLE HR
CHANGE COLUMN п»їEmployee_Name Employee_Name VARCHAR(30) NULL;

-- Change column name from 'DOB' to 'Birthday'
ALTER TABLE HR
CHANGE COLUMN DOB Birthdate VARCHAR(20) NULL;

DESCRIBE HR;

SELECT Birthdate, DateofHire, DateofTermination, LastPerformanceReview_Date FROM HR;

SET sql_safe_updates = 0;

-- Change the date format to the standard one
UPDATE HR
SET Birthdate = CASE
    WHEN Birthdate LIKE '%/%' THEN DATE_FORMAT(STR_TO_DATE(Birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    ELSE NULL
END,
DateofHire = CASE
    WHEN DateofHire LIKE '%/%' THEN DATE_FORMAT(STR_TO_DATE(DateofHire, '%m/%d/%Y'), '%Y-%m-%d')
    ELSE NULL
END,
DateofTermination = CASE
    WHEN DateofTermination LIKE '%/%' THEN DATE_FORMAT(STR_TO_DATE(DateofTermination, '%m/%d/%Y'), '%Y-%m-%d')
    ELSE NULL
END,
LastPerformanceReview_Date = CASE
    WHEN LastPerformanceReview_Date LIKE '%/%' THEN DATE_FORMAT(STR_TO_DATE(LastPerformanceReview_Date, '%m/%d/%Y'), '%Y-%m-%d')
    ELSE NULL
END;

-- Change the data type of the date columns
ALTER TABLE HR
MODIFY COLUMN Birthdate DATE,
MODIFY COLUMN DateofHire DATE,
MODIFY COLUMN DateofTermination DATE,
MODIFY COLUMN LastPerformanceReview_Date DATE;

-- Create Age column
ALTER TABLE HR ADD COLUMN Age INT;

-- Fill in the column with the age of the employed persons at the time of employment, using the timestampdiff function
UPDATE HR
SET Age = timestampdiff(YEAR, Birthdate, DateofHire);

SELECT Birthdate, Age FROM HR;

SELECT 
	min(Age) AS Youngest,
    max(Age) AS Oldest
FROM HR
WHERE Age >= 18;