use e_commerce_dbms;

CREATE TABLE users(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
middle_initial CHAR(1),
last_name VARCHAR(50) NOT NULL,
email VARCHAR(20) NOT NULL,
is_admin BOOLEAN DEFAULT FALSE NOT NULL,
birth_date DATE,
address VARCHAR(100),
phone_number VARCHAR(20),
username VARCHAR(20) UNIQUE NOT NULL,
created_at DATETIME NOT NULL,						# bunlar oto girilmeli
updated_at DATETIME NOT NULL,						# bunlar oto girilmeli
cart_id BIGINT NOT NULL,
wishlist_id BIGINT NOT NULL
);

CREATE TABLE carts(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
user_id BIGINT NOT NULL,
FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE wishlists(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
user_id BIGINT NOT NULL,
FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE orders(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
order_date DATETIME NOT NULL,
status ENUM("CREATED","CANCELED","SHIPPED","DELIVERED") DEFAULT "CREATED" NOT NULL,				# enum geliştirilebilir
total_price INT NOT NULL, 																		# burada hesaplanması gerekebilir
user_id BIGINT NOT NULL,
FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE categories(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
description VARCHAR(500) NOT NULL,
image_source VARCHAR(200),
created_at DATETIME NOT NULL,					# bunlar oto girilmeli
updated_at DATETIME NOT NULL					# bunlar oto girilmeli
);

CREATE TABLE products(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
description VARCHAR(500) NOT NULL,
price MEDIUMINT NOT NULL,
# image_source VARCHAR(200),						# array olmalı, bir ürünün 1+ fotosu olabilir
quantity SMALLINT DEFAULT 1 NOT NULL,
category_id BIGINT NOT NULL,
created_at DATETIME NOT NULL,					# bunlar oto girilmeli
updated_at DATETIME NOT NULL,					# bunlar oto girilmeli
FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE product_images(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
product_id BIGINT NOT NULL,
image_url VARCHAR(200) NOT NULL,
image_order SMALLINT DEFAULT 0,    -- to maintain display order of images
is_primary BOOLEAN DEFAULT FALSE,  -- to mark main/thumbnail image
created_at DATETIME NOT NULL,
updated_at DATETIME NOT NULL,
FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE reviews(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
rating CHAR(1) DEFAULT 1 NOT NULL,				# 1-5 arası constraint
title VARCHAR(50) NOT NULL,						
text VARCHAR(500) NOT NULL,
product_id BIGINT NOT NULL,
user_id BIGINT NOT NULL,
created_at DATETIME NOT NULL,					# bunlar oto girilmeli
updated_at DATETIME NOT NULL,					# bunlar oto girilmeli
FOREIGN KEY (user_id) REFERENCES users(id),
FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE cart_items(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
quantity SMALLINT NOT NULL,
cart_id BIGINT NOT NULL,
product_id BIGINT NOT NULL,
FOREIGN KEY (cart_id) REFERENCES carts(id),
FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE wishlist_items(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
wishlist_id BIGINT NOT NULL,
product_id BIGINT NOT NULL,
FOREIGN KEY (wishlist_id) REFERENCES wishlists(id),
FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE order_items(
id BIGINT AUTO_INCREMENT PRIMARY KEY,
quantity SMALLINT NOT NULL,
order_id BIGINT NOT NULL,
product_id BIGINT NOT NULL,
FOREIGN KEY (order_id) REFERENCES orders(id),
FOREIGN KEY (product_id) REFERENCES products(id)
);

ALTER TABLE users
ADD CONSTRAINT fk_user_cart
FOREIGN KEY (cart_id) REFERENCES carts(id);

ALTER TABLE users
ADD CONSTRAINT fk_user_wishlist
FOREIGN KEY (wishlist_id) REFERENCES wishlists(id);

-- DROP SCHEMA e_commerce_dbms;
-- CREATE SCHEMA e_commerce_dbms;