use employees;

/*
SUBQUERY - a nested SELECT within another query...

SELECT column_a, column_b, column_c
FROM table_a
WHERE column_a IN (
    SELECT column_a
    FROM table_b
    WHERE column_b = true
);

JOINS:
- often used when data is needed from two or more tables
- returns only rows of data
- tend to be faster than subqueries
- syntax can be more complex
SUBQUERIES:
- often used when the data of one table needs to be filtered by additional tables
- tend to be more readable than joins
- subqueries may be nested infinitely (avoid many nested queries, if possible)
- may return...
    - rows of data (another table)
    - a single row
    - a column(s) of values
    - a single value (scaler)
 */

USE employees;

# === Find the department info for the 'Customer Service' department
# first, find the department number for the customer service department
SELECT dept_no
FROM departments
WHERE dept_name = 'Customer Service';
# second, use the subquery in an outer query
SELECT *
FROM departments
WHERE dept_no = (
    SELECT dept_no
    FROM departments
    WHERE dept_name = 'Customer Service'
);
# equivalent to this...
SELECT *
FROM departments
WHERE dept_no = 'd009';


# department manager employee number of Sales department
SELECT emp_no
FROM dept_manager
WHERE dept_no IN (
    SELECT dept_no
    FROM departments
    WHERE dept_name = 'Sales'
)
  AND to_date > NOW();


# === Can achieve same results as an inner join...
# find first name and last of all department managers
SELECT e.first_name, e.last_name FROM employees AS e
JOIN dept_manager AS dm ON dm.emp_no = e.emp_no;

SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
);


# find employees with a current salary over 70k
select concat(first_name, ' ', last_name) from employees
where emp_no IN (
    select emp_no from salaries where salary > 70000 and to_date > NOW()
);


# find the names of all current senior engineers
SELECT first_name, last_name FROM employees
WHERE emp_no IN (
    SELECT emp_no FROM titles
    WHERE title = 'Senior Engineer'
);


# ===================================== ADDITIONAL EXAMPLES
# === Get the names of employees with the ten highest salaries
# first, find the list of employees with the highest current salaries
SELECT emp_no, salary
FROM salaries
WHERE to_date > NOW()
ORDER BY salary DESC;

# second, add to outer query
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM salaries
    WHERE to_date > NOW()
    ORDER BY salary DESC
)
LIMIT 10;

# name and hire_date of earliest-hired department employees
SELECT first_name, hire_date
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_emp
    WHERE from_date = (SELECT MIN(from_date) FROM dept_emp)
);

# === Find the names and genders of all current department managers
# first, find the emp_no of all current department managers

SELECT emp_no
FROM dept_manager
WHERE TO_DATE > NOW();

SELECT CONCAT(first_name, ' ', last_name) as full_name, gender
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
    WHERE TO_DATE > NOW()
);


# === Find hire_date of all current engineers
# all senior engineers from Customer Service department

SELECT *
FROM titles
WHERE title = 'Senior Engineer'
  AND emp_no IN (
    SELECT emp_no
    FROM dept_emp
    WHERE dept_no IN (
        SELECT dept_no
        FROM departments
        WHERE dept_name = 'Customer Service'
    )
);
