use e_commerce_dbms;

# users cannot buy a product we dont have

DELIMITER //

CREATE TRIGGER before_cart_item_insert
BEFORE INSERT ON cart_items
FOR EACH ROW
BEGIN
    DECLARE product_quantity INT;

    SELECT quantity INTO product_quantity
    FROM products
    WHERE id = NEW.product_id;

    IF product_quantity <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot add product to cart: product out of stock.';
    END IF;
END//

DELIMITER ;