use e_commerce_dbms;

CREATE TABLE users(
	id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	middle_initial CHAR(1),
	last_name VARCHAR(50) NOT NULL,
    gender CHAR(1) NOT NULL,
    job VARCHAR(100),																	# işsiz olabilir
	email VARCHAR(100) NOT NULL,
	is_admin BOOLEAN DEFAULT FALSE NOT NULL,
	birth_date DATE,
	address VARCHAR(100),
	phone_number VARCHAR(15),
	username VARCHAR(20) UNIQUE NOT NULL,
    password VARCHAR(128) NOT NULL,														# ne ile encode edileceğine göre değişiyor, 128 üstü zor ama (SHA-512)
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
	cart_id INT,																		# BIGINT to INT, 8 bytes to 4 bytes (max value 2.1b), can be null now
	wishlist_id INT																		# can be null now (otherwise it simply couldnt be populated.)
);

CREATE TABLE carts(
	id INT AUTO_INCREMENT PRIMARY KEY,
	user_id INT NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE wishlists(
	id INT AUTO_INCREMENT PRIMARY KEY,
	user_id INT NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE orders(
	id INT AUTO_INCREMENT PRIMARY KEY,
	order_date DATETIME NOT NULL,
	status ENUM('CREATED', 'CANCELED', 'SHIPPED', 'DELIVERED', 'RETURNED', 'REFUNDED') DEFAULT 'CREATED' NOT NULL,
	total_price DECIMAL(10,2) NOT NULL, 												# INT to DECIMAL obviously, biggest value: 99999999.99		10 digit total: 2 digit after point, 8 digit before point						
	user_id INT NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE categories(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	description TEXT NOT NULL,															# to allow descriptions longer than 500 characters.
	image_source VARCHAR(200),
	parent_id INT DEFAULT NULL,															# Self-referencing foreign key for subcategories, if null: it is a parent category
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
	FOREIGN KEY (parent_id) REFERENCES categories(id)
);

CREATE TABLE products(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	description VARCHAR(500) NOT NULL,
	price DECIMAL(10,2) NOT NULL,
	quantity TINYINT DEFAULT 1 NOT NULL,												# bir üründen 255'den fazla olabilecekse SMALLINT kullan
	brand VARCHAR(100),																	# 100 karakter ok gibi
	model VARCHAR(100),
	category_id INT NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
	FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE attributes (															# to keep all attribute types in one column, instead of creating tables for each product category (ram_products, graphic_card_products ...)
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,        												# (e.g., "mhz", "brand")
    category_id INT NOT NULL,         												# (e.g., "ram", "computer parts")
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE attribute_values (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,         				
    attribute_id INT NOT NULL,       												-- id of the attribute "mhz", "brand", "technology" etc.
    value VARCHAR(100) NOT NULL,     												-- (e.g., "3200", "Corsair" ,"DDR4")
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (attribute_id) REFERENCES attributes(id)
);

CREATE TABLE product_images(
	id INT AUTO_INCREMENT PRIMARY KEY,
	product_id INT NOT NULL,
	image_url VARCHAR(200) NOT NULL,
	image_order TINYINT DEFAULT 0,
	is_primary BOOLEAN DEFAULT FALSE,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
	FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE reviews(
	id INT AUTO_INCREMENT PRIMARY KEY,
	rating TINYINT DEFAULT 1 NOT NULL,													# 1-5 arası constraint, char da olabilirdi ama int tutmak daha güvenli
	title VARCHAR(50) NOT NULL,						
	text VARCHAR(500) NOT NULL,
	product_id INT NOT NULL,
	user_id INT NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE cart_items(
	id INT AUTO_INCREMENT PRIMARY KEY,
	quantity TINYINT NOT NULL,
	cart_id INT NOT NULL,
	product_id INT NOT NULL,
	FOREIGN KEY (cart_id) REFERENCES carts(id),
	FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE wishlist_items(
	id INT AUTO_INCREMENT PRIMARY KEY,
	wishlist_id INT NOT NULL,
	product_id INT NOT NULL,
	FOREIGN KEY (wishlist_id) REFERENCES wishlists(id),
	FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE order_items(
	id INT AUTO_INCREMENT PRIMARY KEY,
	quantity TINYINT NOT NULL,
	order_id INT NOT NULL,
	product_id INT NOT NULL,
	FOREIGN KEY (order_id) REFERENCES orders(id),
	FOREIGN KEY (product_id) REFERENCES products(id)
);

ALTER TABLE users
	ADD CONSTRAINT fk_user_cart
	FOREIGN KEY (cart_id) REFERENCES carts(id),
	ADD CONSTRAINT fk_user_wishlist
	FOREIGN KEY (wishlist_id) REFERENCES wishlists(id);

# if a wishlist is deleted, items in it should be deleted too (same for orders and carts)
-- Modifying order_items
ALTER TABLE order_items
DROP FOREIGN KEY order_items_ibfk_1;
ALTER TABLE order_items
ADD CONSTRAINT order_items_ibfk_1
FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE;

-- Modifying wishlist_items
ALTER TABLE wishlist_items
DROP FOREIGN KEY wishlist_items_ibfk_1;
ALTER TABLE wishlist_items
ADD CONSTRAINT wishlist_items_ibfk_1
FOREIGN KEY (wishlist_id) REFERENCES wishlists(id) ON DELETE CASCADE;

-- Modifying cart_items
ALTER TABLE cart_items
DROP FOREIGN KEY cart_items_ibfk_1;
ALTER TABLE cart_items
ADD CONSTRAINT cart_items_ibfk_1
FOREIGN KEY (cart_id) REFERENCES carts(id) ON DELETE CASCADE;