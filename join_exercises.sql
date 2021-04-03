USE join_test_db;

# join(inner join) user_name(id) | role_name(id)
SELECT users.name as user_name,
       roles.name as role_name
FROM users
         JOIN roles
             ON users.role_id = roles.id;

