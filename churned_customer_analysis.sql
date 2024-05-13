--Overview of the data set
SELECT *
FROM dbo.bank_customer_data$;

--Transforming data
ALTER TABLE bank_customer_data$
ADD Age_Group VARCHAR(50);
UPDATE bank_customer_data$
SET Age_Group = 
    CASE 
        WHEN Age BETWEEN 18 AND 24 THEN 'Young Adult'
        WHEN Age BETWEEN 25 AND 54 THEN 'Working Age'
        WHEN Age BETWEEN 55 AND 64 THEN 'Mature Working Age'
        ELSE 'Elderly'
    END;

--Checking the data set after transformation
SELECT *
FROM bank_customer_data$;

--Finding the sample we are working on
SELECT COUNT(CustomerId) AS total_num_customer
FROM bank_customer_data$;

--Where are the customer base form?
SELECT DISTINCT(Geography)
FROM bank_customer_data$;

--Finding the percentage of each gender and each age group
SELECT
	Geography,
	COUNT(CustomerId) AS total_customer,
    SUM(CASE WHEN Gender = 'Male' THEN 1 ELSE 0 END) * 100 / NULLIF(COUNT(*), 0) AS male_percentage,
    SUM(CASE WHEN Gender = 'Female' THEN 1 ELSE 0 END) * 100 / NULLIF(COUNT(*), 0) AS female_percentage,
	SUM(CASE WHEN Age_Group = 'Young Adult' THEN 1 ELSE 0 END) * 100 / NULLIF(COUNT(*), 0) AS young_adult_percentage,
    SUM(CASE WHEN Age_Group = 'Working Age' THEN 1 ELSE 0 END) * 100 / NULLIF(COUNT(*), 0) AS working_age_percentage,
	SUM(CASE WHEN Age_Group = 'Mature Working Age' THEN 1 ELSE 0 END) * 100 / NULLIF(COUNT(*), 0) AS mature_working_age_percentage,
    SUM(CASE WHEN Age_Group = 'Elderly' THEN 1 ELSE 0 END) * 100 / NULLIF(COUNT(*), 0) AS elderly_percentage
FROM bank_customer_data$
GROUP BY Geography;

--Finding the churn rate
SELECT AVG(Exited) * 100 AS Churn_Rate
FROM bank_customer_data$;

--Some statistics of different variables including credit scores, age, tenure, number of products.
SELECT 
	MIN(CreditScore) AS min_cre_score,
	MAX(CreditScore) AS max_cre_score,
	AVG(CreditScore) AS avg_cre_score,
	MIN(Age) AS min_age,
	MAX(Age) AS max_age,
	AVG(Age) AS avg_age,
	MIN(Tenure) AS min_tenure,
	MAX(Tenure) AS max_tenure,
	AVG(Tenure) AS avg_tenure,
	MIN(NumOfProducts) as min_prod_num,
	MAX(NumOfProducts) as max_prod_num,
	AVG(Balance) AS avg_balance,
	AVG(EstimatedSalary) AS avg_estimatedsalary
FROM bank_customer_data$;

----How many accounts having zero in their balance?
SELECT COUNT(CustomerId) AS zero_in_balance
FROM bank_customer_data$
WHERE Balance = 0;

--How many accounts are using the credit card service?
SELECT COUNT(CustomerId) AS with_cre_card
FROM bank_customer_data$
WHERE HasCrCard = 1;

--How many accounts are still active members?
SELECT COUNT(CustomerId) AS active_member
FROM bank_customer_data$
WHERE IsActiveMember = 1;

--How many accounts using credit card service are still active?
SELECT COUNT(CustomerId) AS with_cre_card
FROM bank_customer_data$
WHERE HasCrCard = 1 AND IsActiveMember = 1;

--Finding correlations between variables within the 2037 churned customers
--How many exited customers for each country?
SELECT
	Geography,
	COUNT(*) AS exited_by_country
FROM bank_customer_data$
WHERE Exited = 1
GROUP BY Geography;

--How many exited customers that are above the average age?
SELECT COUNT(*) AS above_avg_age_customer
FROM bank_customer_data$
WHERE Exited = 1 AND Age > 38.9;

--How many exited customers by age group in percentage?
SELECT 
	Age_Group,
	AVG(Exited) * 100 AS exited_percentage_by_agegroup
FROM bank_customer_data$
GROUP BY Age_Group;

--What does the finance of each age group look like within the churned customers?
SELECT
	Age_Group,
	AVG(Balance) AS avg_balance,
	AVG(EstimatedSalary) AS avg_estimatedsalary
FROM bank_customer_data$
WHERE Exited = 1
GROUP BY Age_Group;

--How many exited accounts with the credit score that is lower than 600 (bad credit score)?
SELECT COUNT(CustomerId) AS below_600
FROM bank_customer_data$
WHERE Exited = 1 AND CreditScore <= 600;

--How many exited accounts with the credit score that is higher than 700 (good credit score)?
SELECT COUNT(CustomerId) AS above_700
FROM bank_customer_data$
WHERE Exited = 1 AND CreditScore >= 700;

--How many exited accounts with one product?
SELECT COUNT(*) AS one_product_customers
FROM bank_customer_data$
WHERE Exited = 1 AND NumOfProducts = 1;

--How many exited accounts with more than one product?
SELECT COUNT(*) AS more_than_one_product_customers
FROM bank_customer_data$
WHERE Exited = 1 AND NumOfProducts >= 2;

--How many exited accounts were using the credit card service?
SELECT COUNT(*) AS has_creditcard
FROM bank_customer_data$
WHERE Exited = 1 AND HasCrCard = 1;

--How many exited accounts have been with the bank above 5 years?
SELECT COUNT(*) AS five_year_tenure_customer
FROM bank_customer_data$
WHERE Exited = 1 AND Tenure > 5;

--Finding correlation within the 7963 staying customers to verifying if the insights from the churned customers are correct
--How many staying customers by country?
SELECT
	Geography,
	COUNT(*) AS staying_by_country
FROM bank_customer_data$
WHERE Exited = 0
GROUP BY Geography;

--How many staying customers are above the age of 38.9?
SELECT COUNT(*) AS above_avg_age_customers
FROM bank_customer_data$
WHERE Exited = 0 AND Age > 38.9;

--What does their finance look like for the staying customers?
SELECT
	Age_Group,
	AVG(Balance) AS avg_balance,
	AVG(EstimatedSalary) AS avg_estimatedsalary
FROM bank_customer_data$
WHERE Exited = 0
GROUP BY Age_Group;

--How many staying customers having the credit score below 600 (bad credit score)?
SELECT COUNT(CustomerId) AS below_600
FROM bank_customer_data$
WHERE Exited = 0 AND CreditScore <= 600;

--How many staying customers having the credit score above 700 (good credit score)?
SELECT COUNT(CustomerId) AS above_avg_creditscore
FROM bank_customer_data$
WHERE Exited = 0 AND CreditScore >= 700;

--How many staying customers having one product only?
SELECT COUNT(*) AS one_product_customers
FROM bank_customer_data$
WHERE Exited = 0 AND NumOfProducts = 1;

--How many staying customer having more than one product?
SELECT COUNT(*) AS more_than_one_product_customers
FROM bank_customer_data$
WHERE Exited = 0 AND NumOfProducts >= 2;

--How many staying customers are using credit card service?
SELECT COUNT(*) AS has_creditcard
FROM bank_customer_data$
WHERE Exited = 0 AND HasCrCard = 1;

--How many staying customers have been staying with the bank for more than 5 years?
SELECT COUNT(*) AS five_year_tenure_customer
FROM bank_customer_data$
WHERE Exited = 0 AND Tenure >= 5;
