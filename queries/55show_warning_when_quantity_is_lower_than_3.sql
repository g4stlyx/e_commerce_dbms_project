use e_commerce_dbms;

# show a warning if a product's quantity is less than 3
DELIMITER //

CREATE TRIGGER after_product_update
AFTER UPDATE ON products
FOR EACH ROW
BEGIN
    IF NEW.quantity < 3 AND OLD.quantity >= 3 THEN
      SET @product_quantity_warning = CONCAT('Warning: Product ', NEW.name, ' quantity is below 3 (', CAST(NEW.quantity AS CHAR), ').');
    ELSE
      SET @product_quantity_warning = NULL;
    END IF;
END//

DELIMITER ;