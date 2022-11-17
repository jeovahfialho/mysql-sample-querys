-- Section A - Mysql
-- Exercise 1
-- Description:
-- 1. Write a query to display the name (first_name and last_name) and department ID of all
-- employees in departments 30 or 100 in ascending order.
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID
FROM employees
WHERE DEPARTMENT_ID in (30, 100)
ORDER BY DEPARTMENT_ID ASC

-- Exercise 2
-- Description:
-- 2. Write a query to find the manager ID and the salary of the lowest-paid employee for that
-- manager.
SELECT MANAGER_ID, MIN(SALARY)
FROM employees
GROUP BY MANAGER_ID


-- Exercise 3
-- Description:
-- 3. Write a query to find the name (first_name and last_name) and the salary of the employees
-- who earn more than the employee whose last name is Bell.
SELECT FIRST_NAME, LAST_NAME, SALARY 
FROM employees
WHERE SALARY > (
	SELECT SALARY 
	FROM employees
	WHERE LAST_NAME = 'Bell')

-- Exercise 4
-- Description:
-- 4. Write a query to find the name (first_name and last_name), job, department ID and name of
-- all employees that work in London
SELECT EMP.FIRST_NAME, EMP.LAST_NAME, JOB.JOB_TITLE, EMP.DEPARTMENT_ID, DEP.DEPARTMENT_NAME
FROM employees EMP, departments DEP, jobs JOB, locations LOC
WHERE 
	EMP.JOB_ID = JOB.JOB_ID AND 
	EMP.DEPARTMENT_ID = DEP.DEPARTMENT_ID AND 
	DEP.LOCATION_ID = LOC.LOCATION_ID AND 
	LOC.CITY = 'London'

-- Exercise 5
-- Description:
-- 5. Write a query to get the department name and number of employees in the department
SELECT DEP.DEPARTMENT_NAME, COUNT(*)
FROM employees EMP, departments DEP
WHERE EMP.DEPARTMENT_ID = DEP.DEPARTMENT_ID 
GROUP BY DEP.DEPARTMENT_NAME 

