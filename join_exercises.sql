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