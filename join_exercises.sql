USE join_test_db;

# join(inner join) user_name(id) | role_name(id)
SELECT users.name as user_name,
       roles.name as role_name
FROM users
     JOIN roles
         ON users.role_id = roles.id;


# left join user_name | role_name
SELECT users.name AS user_name,
       roles.name AS role_name
FROM users
     LEFT JOIN roles    # displays users including w/o roles
         ON users.role_id = roles.id;


# right join user_name | role_name
SELECT users.name AS user_name,
       roles.name AS role_name
FROM users
     RIGHT JOIN roles   # displays roles including w/o users
         ON users.role_id = roles.id;


# seed extra user records
INSERT INTO users (name, email, role_id)
VALUES ('jack', 'jack@example.com', 2),
       ('john', 'john@example.com', 2),
       ('cathy', 'cathy@example.com', 2),
       ('jen', 'jen@example.com', null);

# counting the number of users (u.role_id) for each role
SELECT r.name, COUNT(u.role_id) as Users FROM users as u
    RIGHT JOIN roles as r ON u.role_id = r.id
GROUP BY r.id;

USE employees;

# write a query that shows each department along with the name of the current manager
SELECT departments.dept_name AS 'Department Name',
       CONCAT(employees.first_name, ' ', employees.last_name) AS 'Department Manager'
FROM employees
    JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
    JOIN departments ON dept_manager.dept_no = departments.dept_no
WHERE dept_manager.to_date = '9999-01-01'
ORDER BY dept_name;


# find name of all departments currently managed by women
SELECT departments.dept_name AS 'Department Name',
       CONCAT(employees.first_name, ' ', employees.last_name) AS 'Department Manager'
FROM employees
     JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
     JOIN departments ON dept_manager.dept_no = departments.dept_no
WHERE dept_manager.to_date > now() AND employees.gender = 'F'
ORDER BY dept_name;


# find titles of employees working in Customer Service
SELECT titles.title AS 'title', COUNT(titles.emp_no) AS 'Title'
FROM titles
    JOIN dept_emp ON titles.emp_no = dept_emp.emp_no
    JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_no = 'd009'
  AND dept_emp.to_date > NOW()
  AND titles.to_date > NOW()
GROUP BY titles.title;


# find salary of all managers
SELECT departments.dept_name AS 'Department Name',
       CONCAT(employees.first_name, ' ', employees.last_name) AS 'Department Manager',
       salaries.salary AS 'Salary'
FROM employees
        JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
        JOIN departments ON dept_manager.dept_no = departments.dept_no
        JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE dept_manager.to_date > now()
    AND salaries.to_date > now()
ORDER BY salary;