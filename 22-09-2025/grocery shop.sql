CREATE DATABASE GroceryShop;
USE GroceryShop;

CREATE TABLE products (
       product_id int NOT null,
       product_name text NOT null,
       price int NOT null,
       PRIMARY KEY (product_id) );

ALTER TABLE products
ADD category text NOT null;

TRUNCATE TABLE products;
DROP DATABASE groceryshop;