use e_commerce_dbms;

DELIMITER //

CREATE TRIGGER before_review_insert
BEFORE INSERT ON reviews
FOR EACH ROW
BEGIN
    DECLARE order_count INT;
    
    SELECT COUNT(*) INTO order_count
    FROM orders o
    JOIN order_items oi ON o.id = oi.order_id
    WHERE o.user_id = NEW.user_id 
    AND oi.product_id = NEW.product_id
    AND o.status != 'CANCELED';
    
    IF order_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User must purchase the product before reviewing it';
    END IF;
END//

DELIMITER ;

# test: try to review a product user havent bought

INSERT INTO reviews(user_id, rating, title) VALUES ();
