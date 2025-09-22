/*
    PRB1:
        Find employees who earn more than the average salary.
*/

SELECT
    emp_name,
    salary
FROM
    employees
WHERE
    salary > (SELECT AVG(salary) from employees)

/*
    PRB2:
        List departments that have employees earning more than 70,000.
*/

SELECT
    dept_name
FROM
    departments
WHERE
    dept_id IN (SELECT DISTINCT dept_id from employees where salary > 70000)


/*
    PRB3:
        Find the highest-paid employee in each department.
*/

SELECT
    dept_id,
    emp_name,
    salary
FROM 
    employees e
WHERE
    salary = (SELECT MAX(salary) FROM employees WHERE dept_id = e.dept_id)

/*
    PRB4:
        Find employees hired before the average hire date
*/

SELECT
    emp_name,
    hire_date
FROM
    employees
WHERE
    hire_date < (SELECT AVG(hire_date) FROM employees)

/*
    PRB5: Find departments that have more than 1 employee.
*/

SELECT
    dept_name
FROM
    departments
WHERE dept_id IN (SELECT dept_id FROM employees GROUP BY dept_id HAVING COUNT(*) > 1)

/*
    PRB6: Find the average salary of all employees. (No Subquery) 
*/

SELECT
    AVG(salary)
FROM 
    employees

/*
    PRB7: Find all employees who earn more than Bob 
*/

SELECT
    emp_name,
    salary
FROM
    Employees
WHERE salary > (SELECT salary FROM employees WHERE emp_name = 'Bob')

/*
    PRB8: Find the department name of Charlie.
*/

SELECT
    dept_name
FROM
    departments
WHERE
    dept_id = (SELECT dept_id FROM employees WHERE emp_name = 'Charlie')

/*
    PRB9: Find employees who work in the same department as Diana.
*/

SELECT
    emp_name
FROM
    employees
WHERE
    dept_id = (SELECT dept_id FROM employees WHERE emp_name = 'Diana')

/*
    PRB10: Find the employee(s) with the highest salary.
*/

SELECT
    emp_name,
    salary
FROM
    employees
WHERE
    salary = (SELECT MAX(salary) FROM Employees)

/*
    PRB11: Find departments that have at least one employee.
*/

SELECT
    dept_name
FROM
    departments
WHERE
    dept_id IN (SELECT DISTINCT dept_id FROM Employees)


/*
    PRB12: Find employees who were hired before Alice.
*/

SELECT
    emp_name,
    hire_date
FROM
    employees
WHERE
    hire_date < (SELECT hire_date FROM employees WHERE emp_name = 'Alice')

/*
    PRB14: Find employees who earn more than the average salary in their department.
*/

SELECT
    dept_id,
    emp_name,
    salary
FROM
    employees e
WHERE
    salary > (SELECT AVG(salary) FROM employees WHERE dept_id = e.dept_id)

/*
    PRB15: Find the department(s) with the most employees.
*/

SELECT
    dept_name
FROM
    departments
WHERE
    dept_id IN 
            (
                SELECT 
                    dept_id 
                FROM 
                    employees 
                GROUP BY 
                    dept_id 
                HAVING 
                    COUNT(*) = 
                                (
                                    SELECT 
                                        MAX(emp_count) 
                                    FROM 
                                        (
                                            SELECT 
                                                dept_id, 
                                                COUNT(*) AS emp_count 
                                            FROM 
                                                employees 
                                            GROUP BY 
                                                dept_id
                                        )
                                )
            )

/*
    PRB16: List employees whose salary is in the top 3 salaries of the company.
*/

SELECT
    emp_name,
    salary
FROM
    employees
WHERE
    salary IN (SELECT DISTINCT salary from employees ORDER BY salary desc LIMIT 3)

/*
    PRB17: Find the department that pays the highest average salary.
*/

SELECT
    dept_name
FROM
    departments
WHERE
    dept_id = (SELECT dept_id FROM employees GROUP BY dept_id ORDER BY AVG(salary) DESC LIMIT 1)

/*
    PRB18: Find employees who earn more than the average salary of the entire company.
*/

SELECT
    emp_name,
    salary
FROM
    employees
WHERE
    salary > (SELECT AVG(salary) FROM employees)


/*
    PRB19: Find the second highest salary.
*/

SELECT
    MAX(salary) AS second_highest
FROM
    employees
WHERE
    salary < (SELECT MAX(salary) FROM employees)

/*
    PRB20: List departments that have an employee earning more than $100,000..
*/

SELECT
    dept_name
FROM
    departments
WHERE
    dept_id IN (SELECT dept_id FROM employees WHERE salary > 100000)


/*
    PRB21: Find employees who earn the maximum salary in their department.
*/

SELECT
    emp_name,
    salary,
    dept_id
FROM
    employees e
WHERE
    salary = (SELECT MAX(salary) FROM Employees WHERE dept_id = e.dept_id)


/*
    PRB22: Find departments where the average salary is above the overall company average.
*/

SELECT
    dept_name
FROM
    departments d
WHERE
    (SELECT AVG(salary) FROM employees WHERE dept_id = d.dept_id) 
    > (SELECT AVG(salary) FROM employees)

/*
    PRB23: List employees hired before the earliest hire date in the Marketing department.
*/

SELECT
    emp_name,
    hire_date
FROM
    employees
WHERE
    hire_date < (SELECT MIN(hire_date) FROM employees WHERE dept_id = 2)


/*
    PRB24: Find departments that have fewer employees than the Engineering department.
*/

SELECT
    dept_name
FROM
    departments d
WHERE
    (SELECT COUNT(*) FROM employees WHERE dept_id = d.dept_id)
    < (SELECT COUNT(*) FROM employees WHERE dept_id = 3)

/*
    PRB25: Find employees whose salary is above the median salary of the company.
*/

SELECT
    emp_name,
    salary
FROM
    employees
WHERE
    salary > 
    (SELECT AVG(salary) FROM ( SELECT salary FROM employees ORDER BY salary LIMIT 2 - (SELECT COUNT(*) FROM Employees) % 2
    OFFSET (SELECT (COUNT(*) - 1) / 2 FROM Employees)
    ) t
 )



/*
    PRB : 
*/

SELECT
FROM


SELECT * FROM employees;
SELECT * FROM departments;