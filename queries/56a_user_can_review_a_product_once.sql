use e_commerce_dbms;

# test: a user can review a specific product only once.
DELIMITER //
CREATE TRIGGER before_review_insert_2
BEFORE INSERT ON reviews
FOR EACH ROW
BEGIN
   DECLARE review_count INT;
   
   SELECT COUNT(*) INTO review_count
   FROM reviews 
   WHERE user_id = NEW.user_id
   AND product_id = NEW.product_id;
   
   IF review_count >= 1 THEN
       SIGNAL SQLSTATE '45000'
       SET MESSAGE_TEXT = 'User already has reviewed this product. Cannot insert more.';
   END IF;
END//
DELIMITER ;