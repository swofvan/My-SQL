CREATE DATABASE `local_library`;
USE `local_library`;

CREATE TABLE `books` (
       book_id int NOT null,
       title text NOT null);

CREATE TABLE `borrowers` (
       borrower_id int NOT null,
       name text not null,
       book_id int null);

INSERT INTO `books` (`book_id`,`title`)
VALUES (1, 'The Alchemist'),
       (2,'The Power of Now'),
       (3, 'Think and Grow Rich'),
       (4, 'Clean Code');

INSERT INTO `borrowers` (`borrower_id`, `name`, `book_id`)
VALUES (101, 'Alice', 1),
       (102, 'Bob', 2),
       (103, 'Charlie', NULL);

SELECT * FROM books
LEFT JOIN borrowers
ON books.book_id = borrowers.book_id;

SELECT books.title, borrowers.name
FROM borrowers
LEFT JOIN books
ON books.book_id = borrowers.book_id;

SELECT books.book_id, books.title 
FROM books
LEFT JOIN borrowers
ON books.book_id = borrowers.book_id
WHERE borrowers.book_id IS null;

SELECT borrowers.borrower_id, borrowers.name, books.title
FROM borrowers
LEFT JOIN books
ON books.book_id = borrowers.book_id;