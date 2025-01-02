use e_commerce_dbms;

# reduce product quantity after a new order

DELIMITER //

CREATE TRIGGER after_order_item_insert_reduce_stock
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
    UPDATE products
    SET quantity = quantity - NEW.quantity
    WHERE id = NEW.product_id;
END//

DELIMITER ;