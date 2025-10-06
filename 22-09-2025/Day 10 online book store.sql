CREATE TABLE `authors` (
       Author_ID int PRIMARY KEY NOT null,
       Author_name text NOT null,
       Email_address text NOT null,
       UNIQUE (Email_address)
       );

CREATE TABLE `books` (
       Book_ID int NOT null,
       Book_title text NOT null,
       Author_ID int NOT null,
       UNIQUE (Book_ID),
       FOREIGN KEY (Author_ID) REFERENCES `authors` (Author_ID)
       );