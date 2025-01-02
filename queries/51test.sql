use e_commerce_dbms;

# test: update order total price after an order_item is inserted
SET @user_id = (SELECT id FROM users WHERE username="testuser");

INSERT INTO categories(name, description)
VALUES ('Test Category', 'Test Category Description');
SET @category_id = LAST_INSERT_ID();

-- Create test products
INSERT INTO products(name, description, price, category_id, quantity)
VALUES ('Test Product 1', 'Test product description 1', 10.00, @category_id, 5);
SET @product_id1 = LAST_INSERT_ID();

INSERT INTO products(name, description, price, category_id, quantity)
VALUES ('Test Product 2', 'Test product description 2', 20.00, @category_id, 5);
SET @product_id2 = LAST_INSERT_ID();

-- Create a test order
INSERT INTO orders (user_id, order_date, total_price)
VALUES (@user_id, NOW(), 0.00);
SET @order_id = LAST_INSERT_ID();

-- Insert the first order item. The trigger should update the order's total_price to 10.00
INSERT INTO order_items(order_id, product_id, quantity)
VALUES (@order_id, @product_id1, 1);

-- Check the order's total price
SELECT id, total_price FROM orders WHERE id = @order_id;

-- Insert a second order item. The trigger should update the order's total_price to 30.00
INSERT INTO order_items(order_id, product_id, quantity)
VALUES (@order_id, @product_id2, 1);

-- Check the order's total price
SELECT id, total_price FROM orders WHERE id = @order_id;

-- Insert a third order item that contains the first item. The trigger should update the total price to 40.00
INSERT INTO order_items(order_id, product_id, quantity)
VALUES (@order_id, @product_id1, 1);

-- Check the order's total price
SELECT id, total_price FROM orders WHERE id = @order_id;

-- Clean up the database
DELETE FROM order_items where order_id=@order_id;
DELETE FROM orders where id=@order_id;
DELETE FROM products where id=@product_id1;
DELETE FROM products where id=@product_id2;
DELETE FROM categories where id=@category_id;