SELECT *
FROM hr_data.`employee attrition`;


-- 1. Which three departements had the highest satisfaction scores, and which three had the lowest satisfaction scores?
SELECT 
	dept,
	ROUND(AVG(satisfaction_level),2) AS avg_satisfaction
FROM hr_data.`employee attrition`
GROUP BY dept
ORDER BY avg_satisfaction DESC;

-- 2. What is the relationship between salary and satisfaction score?
SELECT
	salary,
    ROUND(AVG(satisfaction_level),2) AS avg_satisfaction
FROM hr_data.`employee attrition`
GROUP BY salary
ORDER BY avg_satisfaction;

-- 3. How did the top two and bottom two depts perform in the following areas?
-- top_dept: 'support', 'managment'
-- bot_dept: 'hr', 'accounting'

-- a. last_evaluation
-- b. number_project
-- c. average_montly_hours
-- d. time_spend_company
-- e. Work_accident
-- f. promotion_last_5years

SELECT 
	CASE 
		WHEN dept IN ('support', 'managment') THEN 'top_dept'
        WHEN dept IN ('hr', 'accounting') THEN 'bot_dept'
	END AS dept_rank,
    COUNT(`Emp ID`) AS num_emps,
    ROUND(AVG(last_evaluation),2) AS avg_last_evaluation,
    ROUND(AVG(number_project),1) AS avg_projects,
    ROUND(AVG(average_montly_hours),2) AS hrs_worked,
    ROUND(AVG(time_spend_company),2) AS time_at_company,
    ROUND(AVG(Work_accident),2) AS avg_num_accidents,
    ROUND(AVG(promotion_last_5years),2) AS avg_num_promotions
FROM hr_data.`employee attrition`
WHERE dept IN ('support', 'managment','hr','accounting')
GROUP BY dept_rank
;

