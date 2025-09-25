CREATE DATABASE BookStoreDB;
USE BookStoreDB;

CREATE TABLE `authors` (
       author_id int NOT null,
       name text NOT null,
       country text NOT null, 
       PRIMARY KEY (author_id));

CREATE TABLE `books` (
       book_id int NOT null,
       title text NOT null,
       price int NOT null,
       author_id int NOT null,
       PRIMARY KEY (book_id),
       FOREIGN KEY (author_id) REFERENCES `authors`(author_id));

ALTER TABLE books
ADD published_year int NOT null;

TRUNCATE TABLE books;