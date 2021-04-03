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