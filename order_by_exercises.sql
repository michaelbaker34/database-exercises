USE employees;

SELECT *
FROM employees
WHERE first_name IN ('Irene','Vidya', 'Maya')
ORDER BY first_name;


SELECT *
FROM employees
WHERE first_name IN ('Irene', 'Vidya', 'Maya')
ORDER BY first_name, last_name;


SELECT *
FROM employees
WHERE first_name IN ('Irene', 'Vidya', 'Maya')
ORDER BY last_name, first_name;


SELECT *
FROM employees
WHERE (first_name = 'Irene'
    OR first_name = 'Vidya'
    OR first_name = 'Maya')
  AND gender = 'M';


SELECT *
FROM employees
WHERE last_name LIKE 'E%'
ORDER BY emp_no;


SELECT CONCAT(first_name, ' ', last_name) AS 'Full Name'
FROM employees
WHERE last_name LIKE '%E'
   AND last_name LIKE 'E%'
ORDER BY emp_no;


SELECT *
FROM employees
WHERE birth_date like '%-12-25'
  AND hire_date BETWEEN '1990-01-01' AND '1999-12-31'
ORDER BY birth_date, hire_date DESC;


SELECT *
FROM employees
WHERE MONTH(birth_date) = 12
AND DAY(birth_date) = 25;


SELECT *, DATEDIFF(NOW(), hire_date) AS 'Days Employed'
FROM employees
WHERE MONTH(birth_date) = 12
AND DAY(birth_date) = 25
AND (
    YEAR(hire_date) BETWEEN 1990 AND 1999
    )
ORDER BY birth_date, hire_date DESC;