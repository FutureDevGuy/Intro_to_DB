-- This script creates the database 'alx_book_store' and the necessary tables for an online bookstore.
-- It uses a conditional statement to avoid errors if the database already exists.

-- Create the database 'alx_book_store' only if it does not already exist.
CREATE DATABASE IF NOT EXISTS ALX_BOOK_STORE;

-- Use the newly created or existing database.
USE ALX_BOOK_STORE;

-- Create the 'Authors' table to store information about book authors.
CREATE TABLE IF NOT EXISTS AUTHORS (
    AUTHOR_ID INT PRIMARY KEY,
    AUTHOR_NAME VARCHAR(215) NOT NULL
);

-- Create the 'Books' table to store information about books.
CREATE TABLE IF NOT EXISTS BOOKS (
    BOOK_ID INT PRIMARY KEY,
    TITLE VARCHAR(130) NOT NULL,
    AUTHOR_ID INT,
    PRICE DOUBLE NOT NULL,
    PUBLICATION_DATE DATE,
    FOREIGN KEY (AUTHOR_ID) REFERENCES AUTHORS(AUTHOR_ID)
);

-- Create the 'Customers' table to store customer information.
CREATE TABLE IF NOT EXISTS CUSTOMERS (
    CUSTOMER_ID INT PRIMARY KEY,
    CUSTOMER_NAME VARCHAR(215) NOT NULL,
    EMAIL VARCHAR(215) NOT NULL UNIQUE,
    ADDRESS TEXT
);

-- Create the 'Orders' table to store order details.
CREATE TABLE IF NOT EXISTS ORDERS (
    ORDER_ID INT PRIMARY KEY,
    CUSTOMER_ID INT,
    ORDER_DATE DATE NOT NULL,
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID)
);

-- Create the 'Order_Details' table to link books to orders and store quantity.
CREATE TABLE IF NOT EXISTS ORDER_DETAILS (
    ORDERDETAILID INT PRIMARY KEY,
    ORDER_ID INT,
    BOOK_ID INT,
    QUANTITY DOUBLE NOT NULL,
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID),
    FOREIGN KEY (BOOK_ID) REFERENCES BOOKS(BOOK_ID)
);
