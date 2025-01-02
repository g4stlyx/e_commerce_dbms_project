use e_commerce_dbms;

# test: reduce product stock after a new order


# delete test values from the db
DELETE FROM orders WHERE id=@order_id;
DELETE FROM order_items WHERE order_id=@order_id;
DELETE FROM reviews WHERE text="This is a test review for a product I bought.";
DELETE FROM products WHERE id=@product_id;
DELETE FROM categories WHERE id=@category_id;