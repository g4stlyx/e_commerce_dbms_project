use e_commerce_dbms;

# test: user cannot buy a product with no stock
SET @user_id = (SELECT id FROM users WHERE username="testuser");

-- Create a test category
INSERT INTO categories(name, description)
VALUES ('Test Category 2', 'Test Category Description');
SET @category_id = LAST_INSERT_ID();

-- Create a product with quantity 0
INSERT INTO products(name, description, price, category_id, quantity)
VALUES ('Out of Stock Product', 'This product is out of stock', 25.00, @category_id, 0);
SET @product_id = LAST_INSERT_ID();

-- Create a test cart
INSERT INTO carts(user_id) VALUES (@user_id);
SET @cart_id = LAST_INSERT_ID();

-- Attempt to add the out-of-stock product to cart
INSERT INTO cart_items (cart_id, product_id, quantity) 
VALUES (@cart_id, @product_id, 1);

-- Create a product with quantity 1
INSERT INTO products(name, description, price, category_id, quantity)
VALUES ('In Stock Product', 'This product is in stock', 25.00, @category_id, 1);
SET @product_id2 = LAST_INSERT_ID();

-- Attempt to add the in-stock product to cart
INSERT INTO cart_items (cart_id, product_id, quantity) 
VALUES (@cart_id, @product_id2, 1);


# delete test values from the db
DELETE FROM cart_items WHERE cart_id=@cart_id;
DELETE FROM carts WHERE id=@cart_id;
DELETE FROM products WHERE id=@product_id;
DELETE FROM products WHERE id=@product_id2;
DELETE FROM categories WHERE id=@category_id;