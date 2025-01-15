use e_commerce_dbms;

# test: reduce product stock after a new order

-- Step 1: Select the initial quantity of a product
SELECT quantity INTO @initial_quantity FROM products WHERE id = (SELECT id FROM products WHERE name="Corsair 4000D Airflow");

-- Step 2: Insert a new record into order_items (triggering the trigger)
INSERT INTO order_items (quantity, order_id, product_id) 
VALUES (2, 167, (SELECT id FROM products WHERE name="Corsair 4000D Airflow"));
SET @order_item_id = LAST_INSERT_ID();

-- Step 3: Check if the quantity of the product has decreased
SELECT quantity FROM products WHERE id = (SELECT id FROM products WHERE name="Corsair 4000D Airflow");

-- Step 4: Verify the decrease
SELECT @initial_quantity - quantity AS quantity_difference FROM products WHERE id = (SELECT id FROM products WHERE name="Corsair 4000D Airflow");

# delete test values from the db
DELETE FROM order_items WHERE order_id=@order_item_id;