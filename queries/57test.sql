use e_commerce_dbms;

# test: username cannot be changed.
SET @user_id = (SELECT id FROM users WHERE username="testuser");

-- Attempt to change the username (should fail)
UPDATE users SET username = 'newusername' WHERE id = @user_id;

-- Attempt to update a different field (should succeed)
UPDATE users SET first_name = 'NewTest' WHERE id = @user_id;

-- Check the user after the update
SELECT id, username, first_name FROM users WHERE id = @user_id;