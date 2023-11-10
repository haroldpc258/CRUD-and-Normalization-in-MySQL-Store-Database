-- Creating the DB
CREATE DATABASE Store_database;

-- Using the DB
USE Store_database;

-- Creating the Tables
CREATE TABLE suppliers (
id INT AUTO_INCREMENT PRIMARY KEY,
supplier_name VARCHAR(100) NOT NULL
);

CREATE TABLE products (
id INT AUTO_INCREMENT PRIMARY KEY,
product_name VARCHAR(100) NOT NULL,
price DOUBLE NOT NULL
);

CREATE TABLE sales (
id INT AUTO_INCREMENT PRIMARY KEY,
sale_date DATE NOT NULL,
customer_doc_type VARCHAR(10) NOT NULL,
customer_doc_number VARCHAR(20) NOT NULL,
Logical_deletion BOOLEAN DEFAULT FALSE
);

CREATE TABLE products_sales (
product_id INT NOT NULL,
sale_id INT NOT NULL,
number_of_units INT NOT NULL,
PRIMARY KEY(product_id, sale_id),
FOREIGN KEY(product_id) REFERENCES products(id),
FOREIGN KEY(sale_id) REFERENCES sales(id)
);

CREATE TABLE products_suppliers (
product_id INT,
supplier_id INT,
PRIMARY KEY(product_id, supplier_id),
FOREIGN KEY(product_id) REFERENCES products(id),
FOREIGN KEY(supplier_id) REFERENCES suppliers(id)
);

-- Filling the tables with information
INSERT INTO suppliers (supplier_name) VALUES
('Supplier A'),
('Supplier B'),
('Supplier C');

INSERT INTO products (product_name, price) VALUES
('Smartphone', 500000),
('Laptop', 1500000),
('Coffee Maker', 100000),
('Headphones', 50000),
('Fitness Tracker', 80000),
('Smart TV', 500000),
('Digital Camera', 800000),
('Bluetooth Speaker', 250000),
('Gaming Console', 1000000),
('Tablet', 300000),
('Earbuds', 50000),
('Smartwatch', 700000),
('Charger', 50000);

INSERT INTO products_suppliers (product_id, supplier_id) VALUES
(1, 1),
(2, 3),
(3, 1), 
(4, 2),  
(5, 1), 
(6, 3), 
(7, 1), 
(8, 2),  
(9, 3), 
(10, 1),
(11, 2), 
(12, 3), 
(13, 1);

INSERT INTO sales (sale_date, customer_doc_type, customer_doc_number) VALUES
('2023-01-15', 'DNI', '12345678'),
('2023-02-20', 'CC', 'A98765432'),
('2023-03-10', 'Passport', 'P87654321'),
('2023-04-05', 'DNI', '56789012'),
('2023-05-18', 'CC', 'B87654321');

INSERT INTO products_sales (product_id, sale_id, number_of_units) VALUES
(1, 1, 2),
(2, 1, 1), 
(3, 2, 1), 
(4, 3, 3),
(5, 3, 2),
(6, 4, 1),
(7, 4, 2), 
(8, 5, 1), 
(9, 5, 1),
(10, 5, 3),
(11, 5, 2),
(12, 5, 1);

-- Logical deletions
UPDATE sales SET Logical_deletion = TRUE WHERE id = 1;
UPDATE sales SET Logical_deletion = TRUE WHERE id = 2;

-- Physical deletions
DELETE FROM products_sales WHERE sale_id = 3;
DELETE FROM sales WHERE id = 3;

-- Modifying products and suppliers
UPDATE products SET product_name = 'Cellphone' WHERE id = 1;
UPDATE products SET product_name = 'Mouse' WHERE id = 2;
UPDATE products SET price = 456000 WHERE id = 3;
UPDATE suppliers SET supplier_name = 'Supplier D' WHERE id = 3;
UPDATE suppliers SET supplier_name = 'Supplier H' WHERE id = 2;
UPDATE suppliers SET supplier_name = 'Supplier E' WHERE id = 1;
UPDATE products_suppliers SET supplier_id = 2 WHERE product_id = 1;
UPDATE products_suppliers SET supplier_id = 1 WHERE product_id = 2;
UPDATE products_suppliers SET supplier_id = 3 WHERE product_id = 3;
