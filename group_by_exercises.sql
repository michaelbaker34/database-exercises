USE employees;

SELECT DISTINCT title
FROM employees.titles;


SELECT DISTINCT first_name, last_name
FROM employees
WHERE last_name LIKE ('%E')
  AND last_name LIKE ('E%')
GROUP BY last_name, first_name
ORDER BY last_name;


SELECT COUNT(*), last_name
FROM employees
WHERE last_name LIKE '%q%'
  AND last_name NOT LIKE '%qu%'
GROUP BY last_name
ORDER BY last_name;


SELECT COUNT(*), gender
FROM employees
WHERE
    (
        first_name = 'Irena'
        OR first_name = 'Vidya'
        OR first_name = 'Maya'
        )
GROUP BY gender
ORDER BY gender;