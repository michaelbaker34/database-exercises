USE join_test_db;

# join(inner join) user_name(id) | role_name(id)
SELECT users.name as user_name,
       roles.name as role_name
FROM users
         JOIN roles
             ON users.role_id = roles.id;


# left join user_name(name) | role_name(role)
SELECT users.name AS user_name,
       roles.name AS role_name
FROM users
         LEFT JOIN roles
             ON users.role_id = roles.id;