use e_commerce_dbms;

# prevent username changes
DELIMITER //
CREATE TRIGGER before_user_username_update
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    IF NEW.username != OLD.username THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Username cannot be changed.';
    END IF;
END//
DELIMITER ;