use e_commerce_dbms;

# test: try to review a product user havent bought
SET @user_id = (SELECT id FROM users WHERE username="testuser");

-- Create a product
INSERT INTO categories(name, description)
VALUES ('Test Category', 'Test Category Description');
SET @category_id = LAST_INSERT_ID();

INSERT INTO products(name, description, price, category_id, quantity)
VALUES ('Test Product', 'Test product description', 10.00, @category_id, 5);
SET @product_id = LAST_INSERT_ID();

-- Attempt to review without buying
INSERT INTO reviews(user_id, rating, title, text, product_id) 
VALUES (@user_id, 5, 'Test Review', 'This is a test review for a product I haven\'t bought.', @product_id);

-- Buy and review
INSERT INTO orders (user_id, order_date, total_price) 
VALUES (@user_id, now(), 10.00);

SET @order_id = LAST_INSERT_ID();

INSERT INTO order_items(order_id, product_id, quantity)
VALUES (@order_id, @product_id, 1);

INSERT INTO reviews(user_id, rating, title, text, product_id) 
VALUES (@user_id, 5, 'Test Review', 'This is a test review for a product I bought.', @product_id);

# delete test values from the db
DELETE FROM orders WHERE id=@order_id;
DELETE FROM order_items WHERE order_id=@order_id;
DELETE FROM reviews WHERE text="This is a test review for a product I bought.";
DELETE FROM products WHERE id=@product_id;
DELETE FROM categories WHERE id=@category_id;
# DELETE FROM users WHERE id=@user_id; 													# no user will be deleted
