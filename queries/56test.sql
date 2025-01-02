use e_commerce_dbms;

# test: a user can review a specific product max once
SET @user_id = (SELECT id FROM users WHERE username="testuser");

INSERT INTO categories(name, description)
VALUES ('Test Category', 'Test Category Description');
SET @category_id = LAST_INSERT_ID();

INSERT INTO products(name, description, price, category_id, quantity)
VALUES ('Test Product', 'Test product description', 10.00, @category_id, 5);
SET @product_id = LAST_INSERT_ID();

-- Create an order for the user (otherwise cannot create reviews since the product hasn't been bought)
INSERT INTO orders (user_id, order_date, total_price)
VALUES (@user_id, now(), 10.00);
SET @order_id = LAST_INSERT_ID();

INSERT INTO order_items(order_id, product_id, quantity)
VALUES (@order_id, @product_id, 1);

-- Insert a review for the user for the product
INSERT INTO reviews(user_id, rating, title, text, product_id)
VALUES (@user_id, 5, 'Test Review 1', 'First review for test product.', @product_id);

-- Attempt to insert another review for the same product (should fail)
INSERT INTO reviews(user_id, rating, title, text, product_id)
VALUES (@user_id, 4, 'Test Review 2', 'Second review for test product.', @product_id);

-- Attempt to insert another review for another product (should succeed)
INSERT INTO products(name, description, price, category_id, quantity)
VALUES ('Test Product 3', 'Test product description 2', 10.00, @category_id, 5);
SET @product_id2 = LAST_INSERT_ID();

-- Create an order for the user for another product
INSERT INTO orders (user_id, order_date, total_price)
VALUES (@user_id, now(), 10.00);
SET @order_id2 = LAST_INSERT_ID();

INSERT INTO order_items(order_id, product_id, quantity)
VALUES (@order_id2, @product_id2, 1);

INSERT INTO reviews(user_id, rating, title, text, product_id)
VALUES (@user_id, 4, 'Test Review 2', 'Second review for test product.', @product_id2);


# revert changes
DELETE FROM reviews WHERE text="First review for test product.";
DELETE FROM reviews WHERE text="Second review for test product.";
DELETE FROM orders WHERE id=@order_id;
DELETE FROM order_items WHERE order_id=@order_id;
DELETE FROM order_items WHERE order_id=@order_id2;
DELETE FROM products WHERE id=@product_id;
DELETE FROM products WHERE id=@product_id2;
DELETE FROM categories WHERE id=@category_id;

