USE codeup_test_db;

DROP TABLE IF EXISTS albums;

CREATE TABLE albums (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    artist VARCHAR(100) NOT NULL,
    name VARCHAR(100),
    release_date DATE,
    sales INT,
    genre VARCHAR(100),
    PRIMARY KEY(id)
);