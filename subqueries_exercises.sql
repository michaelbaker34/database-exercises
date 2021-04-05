USE employees;

# Find all the employees with the same hire date as employee 101010 using a subquery.
SELECT *
FROM employees
WHERE employees.hire_date = (
    SELECT employees.hire_date
    FROM employees
    WHERE emp_no = '101010'
    );


SELECT *, COUNT(title)
FROM titles
WHERE emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE first_name = 'Aamod'
)
GROUP BY title;


SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
    WHERE gender = 'F'
        AND to_date > now()
    );
