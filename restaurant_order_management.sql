-- ===============================
-- CREATE DATABASE
-- ===============================
CREATE DATABASE cafe_db;
USE cafe_db;
-- ===============================
-- CREATE CUSTOMERS TABLE
-- ===============================
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    gender ENUM('male','female','others'),
    city VARCHAR(50)
);
-- ===============================
-- CREATE MENU TABLE
-- ===============================
CREATE TABLE IF NOT EXISTS menu (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    item_name VARCHAR(100),
    price INT
);
-- ===============================
-- CREATE ORDERS TABLE
-- ===============================
CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
-- ===============================
-- INSERT DATA
-- ===============================
INSERT INTO customers (customer_name, gender, city)
VALUES
('vinaya', 'female', 'London'),
('Rahul', 'male', 'Delhi'),
('Aisha', 'female', 'Mumbai');
INSERT INTO menu (item_name, price)
VALUES
('Pizza', 200),
('Burger', 150),
('Pasta', 180);

INSERT INTO orders (customer_id, order_date)
VALUES
(1, '2026-04-26'),
(2, '2026-04-26'),
(3, '2026-04-27');
-- ===============================
-- BASIC QUERIES
-- ===============================
-- Show all customers
SELECT * FROM customers;

-- Filter data
SELECT * FROM customers WHERE city = 'London';

-- Join example
SELECT customers.customer_name, orders.order_id
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;

-- Update example
UPDATE customers
SET city = 'Paris'
WHERE customer_id = 1;

-- Delete example
DELETE FROM orders
WHERE order_id = 3;