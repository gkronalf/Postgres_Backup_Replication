CREATE DATABASE otus;
\c otus;
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    user_email VARCHAR(50)
);
INSERT INTO users VALUES(1, 'Pupkin Pupok', 'pupkin@yandex.ru');
INSERT INTO users VALUES(2, 'Ivanov Ivan', 'ivanov@mail.ru');
INSERT INTO users VALUES(3, 'Eshtan Piter', 'eshtan@gmail.com');