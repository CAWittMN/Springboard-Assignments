-- Comments in SQL Start with dash-dash --

-- Add product with name of "char", price of 44.00, that can't be returned. --
INSERT INTO products (name, price, can_be_returned) 
VALUES ('chair', 44.00, false);

--Add a product with name of 'stool', price of 25.99, that can be returned.
INSERT INTO products (name, price, can_be_returned)
VALUES ('stool', 25.99, true);

--Add a product with name of 'table', price of 124.00, that can't be returned.
INSERT INTO products (name, price, can_be_returned)
VALUES ('table', 124.00, false);

--Display all rows and columns of the table.
SELECT *
FROM products;

--Display all of the names of products.
SELECT name
FROM products;

--Display all of the names and prices of products.
SELECT name, price
FROM products;

--Add a new product-
INSERT INTO products (name, price, can_be_returned)
VALUES ('desk', 150.50, true);

--Display only products that can be returned.
SELECT *
FROM products
WHERE can_be_returned;

--Display only the products that have a price less than 44.00.
SELECT *
FROM products
WHERE price > 44.00;

--Display only the products that have a price between 22.50 and 99.99.
SELECT *
FROM products
WHERE price BETWEEN 22.50 AND 99.99;

--Update the database for a $20 off sale.
UPDATE products SET price = price - 20;

--Everything under $25 sold out.
DELETE FROM products WHERE price < 25;

--The sale is over.
UPDATE products SET price = price + 20;

--Everything is now returnable.
UPDATE products SET can_be_returned = true;
