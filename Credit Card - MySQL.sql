create database credit_card;
use credit_card;

select * from credit_card_clean;

-- 1) Group the customers based on their income type and find the average of their annual income.

select type_income,round(avg(annual_income),2) as avg_anuual_income,count(*) as customer_count from credit_card_clean
group by type_income;



-- 2) Find the female owners of cars and property.
select gender,count(car_owner) as F_car_owner,count(propert_owner) as F_property_owner from credit_card_clean 
where gender = "F" and car_owner = 'Y' and propert_owner = 'Y'
group by gender;

-- 3)Find the male customers who are staying with their families.

select * from credit_card_clean
where housing_type = "with parents" and gender = 'M';

-- 4) Please list the top five people having the highest income.
SELECT 
    *
FROM
    credit_card_clean
ORDER BY annual_income DESC
LIMIT 5;

-- 5) How many married people are having bad credit?

select count(*) as married_bad_credit_people from credit_card_clean
where marital_status = 'Married' and approval_status = 0; 


-- 6) What is the highest education level and what is the total count?

select education,count(*) as total_count from credit_card_clean
group by education limit 1;


-- 7) Between married males and females, who is having more bad credit? 

SELECT 
    gender, COUNT(*) AS Bad_credits_Count
FROM
    credit_card_clean
WHERE
    approval_status = 0
        AND marital_status = 'Married'
GROUP BY gender;




