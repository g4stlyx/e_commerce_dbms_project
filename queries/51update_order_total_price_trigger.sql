DELIMITER //

CREATE TRIGGER after_order_item_insert
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
    UPDATE orders
    SET total_price = (
        SELECT SUM(oi.quantity * p.price)
        FROM order_items oi
        JOIN products p ON p.id = oi.product_id
        WHERE oi.order_id = NEW.order_id
    )
    WHERE id = NEW.order_id;
END//

DELIMITER ;