use e_commerce_dbms;

# test: show warning when quantity is less than 3

-- test category
INSERT INTO categories(name, description)
VALUES ('Test Category', 'Test Category Description');
SET @category_id = LAST_INSERT_ID();

-- test product with an initial quantity of 5
INSERT INTO products(name, description, price, category_id, quantity)
VALUES ('Test Product', 'A test product', 10.00, @category_id, 5);
SET @product_id = LAST_INSERT_ID();

-- This should trigger the before_product_update trigger and show an error.
UPDATE products SET quantity = 2 WHERE id = @product_id;
SELECT @product_quantity_warning;

-- This should not trigger the trigger.
UPDATE products SET quantity = 4 WHERE id = @product_id;
SELECT @product_quantity_warning;

-- This should trigger the before_product_update trigger and show an error.
UPDATE products SET quantity = 1 WHERE id = @product_id;
SELECT @product_quantity_warning;

# delete test values from the db
DELETE FROM products WHERE id=@product_id;
DELETE FROM categories WHERE id=@category_id;
