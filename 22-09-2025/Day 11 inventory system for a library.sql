--  You are designing a basic inventory system for a library. Your task is to:
-- Create a table named authors with the following:
-- author_id which should increase automatically for every new author added
-- name of the author
-- Create another table named books with the following:
-- book_id which should also increase automatically
-- title of the book
-- author_id which connects each book to an author
-- Make sure that one author can have many books (one-to-many relationship).
-- Create an index on the author_id column in the books table to improve search performance.

CREATE TABLE `authors` (
       author_id int AUTO_INCREMENT NOT null,
       name_of_the_author text,
       PRIMARY KEY (author_id)
       );

CREATE TABLE books (
       book_id int AUTO_INCREMENT PRIMARY KEY NOT null,
       title text,
       author_id int NOT null,
       FOREIGN KEY (author_id) REFERENCES `authors`(author_id)
       );

SELECT `authors`.name_of_the_author, `books`.title 
FROM `authors`
INNER JOIN `books`
ON `authors`.author_id = `books`.author_id;

ALTER TABLE `books`
ADD INDEX id (author_id);