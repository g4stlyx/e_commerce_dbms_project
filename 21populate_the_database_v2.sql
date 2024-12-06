use e_commerce_dbms;

-- Insert main categories
INSERT INTO categories (name, description, parent_id) VALUES
('Computer Parts', 'Components and parts for building computers', NULL),
('Computers', 'desktop and laptop computers, ready to use', NULL),
('Peripherals', 'Computer peripherals and accessories', NULL);

-- Insert subcategories for Computer Parts
-- why using two selects to get the category_id : https://stackoverflow.com/a/43610081/21996724 (if not: Error Code: 1093. You can't specify target table 'categories' for update in FROM clause)
INSERT INTO categories (name, description, parent_id) VALUES
('Processor', 'Central Processing Units (CPUs)', (SELECT * FROM (SELECT id FROM categories WHERE name = 'Computer Parts') as c)),
('Motherboard', 'Main circuit boards', (SELECT * FROM(SELECT id FROM categories WHERE name = 'Computer Parts') as c)),
('RAM', 'Random Access Memory modules', (SELECT * FROM(SELECT id FROM categories WHERE name = 'Computer Parts') as c)),
('Graphic Card', 'Graphics Processing Units (GPUs)', (SELECT * FROM(SELECT id FROM categories WHERE name = 'Computer Parts') as c)),
('Computer Case', 'PC Cases and chassis', (SELECT * FROM (SELECT id FROM categories WHERE name = 'Computer Parts')as c)),
('Power Supply', 'Power Supply Units (PSUs)', (SELECT * FROM (SELECT id FROM categories WHERE name = 'Computer Parts') as c));

-- Insert subcategories for Electronics
-- why using two selects to get the category_id : https://stackoverflow.com/a/43610081/21996724 (if not: Error Code: 1093. You can't specify target table 'categories' for update in FROM clause)
INSERT INTO categories (name, description, parent_id) VALUES
('Laptop', 'Portable laptops and notebooks', (SELECT * FROM (SELECT id FROM categories WHERE name = 'Computers')as c)),
('Desktop', 'Desktop computers', (SELECT * FROM(SELECT id FROM categories WHERE name = 'Computers')as c));

-- Insert subcategories for Peripherals
-- why using two selects to get the category_id : https://stackoverflow.com/a/43610081/21996724 (if not: Error Code: 1093. You can't specify target table 'categories' for update in FROM clause)
INSERT INTO categories (name, description, parent_id) VALUES
('Monitor', 'Computer displays and monitors', (SELECT * FROM(SELECT id FROM categories WHERE name = 'Peripherals')as c)),
('Keyboard', 'Computer keyboards', (SELECT * FROM(SELECT id FROM categories WHERE name = 'Peripherals')as c)),
('Mouse', 'Computer mice and pointing devices', (SELECT * FROM(SELECT id FROM categories WHERE name = 'Peripherals')as c)),
('Headphone', 'Audio headphones and headsets', (SELECT * FROM(SELECT id FROM categories WHERE name = 'Peripherals')as c));

-- // MAIN CATEGORIES /////////////////////////////////////////////////////////////////////

-- Computer Parts attributes: brand and model are enough actually (they are in products since they are common for all product categories)
-- Computers attributes:
INSERT INTO attributes (name, category_id) VALUES
('Processor Brand', (SELECT id FROM categories WHERE name = 'Computers')),
('Processor Model', (SELECT id FROM categories WHERE name = 'Computers')),
('GPU Producer', (SELECT id FROM categories WHERE name = 'Computers')),
('GPU Model', (SELECT id FROM categories WHERE name = 'Computers')),
('Ram Capacity', (SELECT id FROM categories WHERE name = 'Computers')),
('Ram Frequency', (SELECT id FROM categories WHERE name = 'Computers')),
('Ram Type', (SELECT id FROM categories WHERE name = 'Computers')),
('SSD Capacity', (SELECT id FROM categories WHERE name = 'Computers')),
('HDD Capacity', (SELECT id FROM categories WHERE name = 'Computers'));
-- Peripherals attributes
INSERT INTO attributes (name, category_id) VALUES
('Connectivity Type', (SELECT id FROM categories WHERE name = 'Peripherals'));		# Bluetooth/Wired/USB etc.

-- // SUBCATEGORIES - COMPUTER PARTS /////////////////////////////////////////////////////////

-- Motherboard specific attributes
INSERT INTO attributes (name, category_id) VALUES
('Processor Type', (SELECT id FROM categories WHERE name = 'Motherboard')),
('Socket Type', (SELECT id FROM categories WHERE name = 'Motherboard')),
('Ram Type', (SELECT id FROM categories WHERE name = 'Motherboard')),
('Ram Slot Count', (SELECT id FROM categories WHERE name = 'Motherboard')),
('Size', (SELECT id FROM categories WHERE name = 'Motherboard'));

-- CPU specific attributes
INSERT INTO attributes (name, category_id) VALUES
('Generation', (SELECT id FROM categories WHERE name = 'Processor')),   # intel 15th gen., ryzen 9000 series
('Socket Type', (SELECT id FROM categories WHERE name = 'Processor')),	# AM4, AM5, LGA 1851 etc.
('CPU Frequency Speed', (SELECT id FROM categories WHERE name = 'Processor')), # 3.0 GHz etc.
('Core Count', (SELECT id FROM categories WHERE name = 'Processor'));	# 4, 16, 20 etc.

-- RAM specific attributes
INSERT INTO attributes (name, category_id) VALUES
('Ram Capacity', (SELECT id FROM categories WHERE name = 'RAM')),	# 16 GB, 64 GB etc.
('Frequency Speed', (SELECT id FROM categories WHERE name = 'RAM')),	# 3200 MHz, 6000 MHz
('Ram Type', (SELECT id FROM categories WHERE name = 'RAM'));		# DDR4, DDR5

-- GPU specific attributes
INSERT INTO attributes (name, category_id) VALUES
('GPU Producer', (SELECT id FROM categories WHERE name = 'Graphic Card')),	# NVIDIA, AMD, INTEL (not the same as brand in computer parts)
('VRAM', (SELECT id FROM categories WHERE name = 'Graphic Card')),			# 6GB, 8GB
('Memory Type', (SELECT id FROM categories WHERE name = 'Graphic Card'));	# GDDR4, GDDR5

-- Computer Case specific attributes
INSERT INTO attributes (name, category_id) VALUES
('Motherboard Size', (SELECT id FROM categories WHERE name = 'Computer Case')),
('Material', (SELECT id FROM categories WHERE name = 'Computer Case'));

-- Power Supply specific attributes
INSERT INTO attributes (name, category_id) VALUES
('Wattage', (SELECT id FROM categories WHERE name = 'Power Supply')),
('Efficiency Rating', (SELECT id FROM categories WHERE name = 'Power Supply'));

-- // SUBCATEGORIES - COMPUTERS /////////////////////////////////////////////////////////

-- Laptop specific attributes
INSERT INTO attributes (name, category_id) VALUES
('Laptop Screen Size', (SELECT id FROM categories WHERE name = 'Laptop'));

-- // SUBCATEGORIES - Peripherals /////////////////////////////////////////////////////////

-- Monitor specific attributes
INSERT INTO attributes (name, category_id) VALUES
('Screen Size', (SELECT id FROM categories WHERE name = 'Monitor')),			# inches
('Panel Type', (SELECT id FROM categories WHERE name = 'Monitor')),				# (IPS/TN/VA)
('Resolution', (SELECT id FROM categories WHERE name = 'Monitor')),				# çözünürlük, 2K, 4K etc.
('Refresh Rate', (SELECT id FROM categories WHERE name = 'Monitor')),			# ms
('Response Time', (SELECT id FROM categories WHERE name = 'Monitor'));			# ms

-- Keyboard specific attributes
INSERT INTO attributes (name, category_id) VALUES
('Key Layout', (SELECT id FROM categories WHERE name = 'Keyboard')),			# qTürkçe, fTürkçe, qİngilizce...
('Keyboard Type', (SELECT id FROM categories WHERE name = 'Keyboard'));			# mechanical, membrane

-- Mouse specific attributes
INSERT INTO attributes (name, category_id) VALUES
('Button Count', (SELECT id FROM categories WHERE name = 'Mouse')),
('Max DPI', (SELECT id FROM categories WHERE name = 'Mouse'));

-- add sample products
INSERT INTO products (name, description, price, quantity, brand, model, category_id) VALUES
-- CPUs
('AMD Ryzen 7 5800X', '8-core processor for gaming and productivity', 299.99, 50, "AMD", "Ryzen 7 5800X", (SELECT id FROM categories WHERE name = 'Processor')),
('Intel Core i9-12900K', 'High-end desktop processor', 589.99, 30, "Intel", "Core i9-12900K", (SELECT id FROM categories WHERE name = 'Processor')),

-- RAM
('Corsair Vengeance LPX 16GB', 'High-performance DDR4 RAM', 89.99, 100, "Corsair", "Vengeance LPX", (SELECT id FROM categories WHERE name = 'RAM')),
('G.Skill Ripjaws V 32GB', 'Dual channel DDR4 memory kit', 129.99, 75, "G.Skill", "Ripjaws V", (SELECT id FROM categories WHERE name = 'RAM')),

-- Graphics Cards
('MSI GeForce RTX 4070 SUPER', 'High-end graphics card', 899.99, 20, "MSI", "GeForce RTX 4070 SUPER", (SELECT id FROM categories WHERE name = 'Graphic Card')),
('AMD RX 6800 XT', 'Gaming graphics card', 649.99, 25, "AMD", "RX 6800 XT", (SELECT id FROM categories WHERE name = 'Graphic Card'));

-- Add attribute values for Ryzen 7 5800X
INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'AMD Ryzen 7 5800X'),
 (SELECT id FROM attributes WHERE name = 'Generation'),
 'Ryzen 5000 Series'),
((SELECT id FROM products WHERE name = 'AMD Ryzen 7 5800X'),
 (SELECT id FROM attributes WHERE name = 'Socket Type'),
 'AM4'),
((SELECT id FROM products WHERE name = 'AMD Ryzen 7 5800X'),
 (SELECT id FROM attributes WHERE name = 'Frequency Speed'),
 '3.8GHz'),
 ((SELECT id FROM products WHERE name = 'AMD Ryzen 7 5800X'),
 (SELECT id FROM attributes WHERE name = 'Core Count'),
 '8');

-- Add attribute values for Corsair RAM
INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'Corsair Vengeance LPX 16GB'),
 (SELECT id FROM attributes WHERE name = 'Capacity'),
 '16GB'),
((SELECT id FROM products WHERE name = 'Corsair Vengeance LPX 16GB'),
 (SELECT id FROM attributes WHERE name = 'Frequency Speed'),
 '3200MHz'),
 ((SELECT id FROM products WHERE name = 'Corsair Vengeance LPX 16GB'),
 (SELECT id FROM attributes WHERE name = 'Ram Type'),
 'DDR4');
 
 -- Add attribute values for MSI GeForce RTX 4070 SUPER
INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'MSI GeForce RTX 4070 SUPER'),
 (SELECT id FROM attributes WHERE name = 'GPU Producer'),
 'NVIDIA'),
((SELECT id FROM products WHERE name = 'MSI GeForce RTX 4070 SUPER'),
 (SELECT id FROM attributes WHERE name = 'VRAM'),
 '12GB'),
 ((SELECT id FROM products WHERE name = 'MSI GeForce RTX 4070 SUPER'),
 (SELECT id FROM attributes WHERE name = 'Memory Type'),
 'GDDR6X');

-- carts, wishlists, users
INSERT INTO users (first_name, last_name, email, username, birth_date, address, phone_number) VALUES
('John', 'Doe', 'john.doe@email.com', 'johndoe', '1990-05-15', '123 Main St, City', '+1234567890'),
('Jane', 'Smith', 'jane.smith@email.com', 'janesmith', '1992-08-22', '456 Oak Ave, Town', '+1234567891'),
('Mike', 'Johnson', 'mike.j@email.com', 'mikej', '1988-03-10', '789 Pine Rd, Village', '+1234567892'),
('Sarah', 'Williams', 'sarah.w@email.com', 'sarahw', '1995-11-30', '321 Elm St, City', '+1234567893'),
('David', 'Brown', 'david.b@email.com', 'davidb', '1985-07-18', '654 Maple Dr, Town', '+1234567894');
INSERT INTO carts (id, user_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
INSERT INTO wishlists (id, user_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
# user tablosuna cart'ları ve wishlist'leri ekle
UPDATE users
SET cart_id = (SELECT id FROM carts WHERE user_id = users.id),
    wishlist_id = (SELECT id FROM wishlists WHERE user_id = users.id);

INSERT INTO cart_items (quantity, cart_id, product_id) VALUES
(2, 1, (SELECT id FROM products WHERE name = 'AMD Ryzen 7 5800X')),
(1, 1, (SELECT id FROM products WHERE name = 'Corsair Vengeance LPX 16GB')),
(1, 2, (SELECT id FROM products WHERE name = 'NVIDIA RTX 4080')),
(3, 3, (SELECT id FROM products WHERE name = 'G.Skill Ripjaws V 32GB')),
(1, 4, (SELECT id FROM products WHERE name = 'Intel Core i9-12900K'));

INSERT INTO wishlist_items (wishlist_id, product_id) VALUES
(1, (SELECT id FROM products WHERE name = 'NVIDIA RTX 4080')),
(1, (SELECT id FROM products WHERE name = 'AMD RX 6800 XT')),
(2, (SELECT id FROM products WHERE name = 'Corsair Vengeance LPX 16GB')),
(3, (SELECT id FROM products WHERE name = 'AMD Ryzen 7 5800X')),
(4, (SELECT id FROM products WHERE name = 'G.Skill Ripjaws V 32GB'));

-- orders and order items
INSERT INTO orders (order_date, status, total_price, user_id) VALUES
('2024-01-15 10:30:00', 'DELIVERED', 689.97, 1),  -- Ryzen 7 + RAM
('2024-02-01 15:45:00', 'SHIPPED', 899.99, 2),    -- RTX 4080
('2024-02-15 09:15:00', 'CREATED', 389.97, 3),    -- 3x RAM
('2024-03-01 14:20:00', 'DELIVERED', 589.99, 4),  -- i9-12900K
('2024-03-10 11:30:00', 'CANCELED', 649.99, 5);   -- RX 6800 XT

INSERT INTO order_items (quantity, order_id, product_id) VALUES
(1, 1, (SELECT id FROM products WHERE name = 'AMD Ryzen 7 5800X')),
(1, 1, (SELECT id FROM products WHERE name = 'Corsair Vengeance LPX 16GB')),
(1, 2, (SELECT id FROM products WHERE name = 'NVIDIA RTX 4080')),
(3, 3, (SELECT id FROM products WHERE name = 'Corsair Vengeance LPX 16GB')),
(1, 4, (SELECT id FROM products WHERE name = 'Intel Core i9-12900K')),
(1, 5, (SELECT id FROM products WHERE name = 'AMD RX 6800 XT'));

-- reviews
INSERT INTO reviews (rating, title, text, product_id, user_id) VALUES
(5, 'Great CPU!', 'Excellent performance for gaming and productivity. Runs cool and stable.', 
    (SELECT id FROM products WHERE name = 'AMD Ryzen 7 5800X'),
    1),
(4, 'Good RAM', 'Stable performance, easy to install, works at rated speeds.',
    (SELECT id FROM products WHERE name = 'Corsair Vengeance LPX 16GB'),
    2),
(5, 'Amazing Graphics Card', 'Incredible performance, handles all games at 4K easily.',
    (SELECT id FROM products WHERE name = 'NVIDIA RTX 4080'),
    3),
(4, 'Solid CPU Choice', 'Great performance but runs a bit hot under load.',
    (SELECT id FROM products WHERE name = 'Intel Core i9-12900K'),
    4),
(5, 'Excellent Value GPU', 'Great performance for the price, runs cool and quiet.',
    (SELECT id FROM products WHERE name = 'AMD RX 6800 XT'),
    5);
    
-- product images (local'de olduğu varsayıldı, netten url de çekilebilirdi)
INSERT INTO product_images (product_id, image_url, image_order, is_primary, created_at, updated_at) VALUES
((SELECT id FROM products WHERE name = 'AMD Ryzen 7 5800X'),
 'images/products/ryzen-7-5800x-main.jpg', 1, TRUE, NOW(), NOW()),
((SELECT id FROM products WHERE name = 'AMD Ryzen 7 5800X'),
 'images/products/ryzen-7-5800x-box.jpg', 2, FALSE, NOW(), NOW()),
((SELECT id FROM products WHERE name = 'Corsair Vengeance LPX 16GB'),
 'images/products/corsair-vengeance-main.jpg', 1, TRUE, NOW(), NOW()),
((SELECT id FROM products WHERE name = 'NVIDIA RTX 4080'),
 'images/products/rtx-4080-main.jpg', 1, TRUE, NOW(), NOW()),
((SELECT id FROM products WHERE name = 'NVIDIA RTX 4080'),
 'images/products/rtx-4080-back.jpg', 2, FALSE, NOW(), NOW());


-- DROP SCHEMA e_commerce_dbms;
-- CREATE SCHEMA e_commerce_dbms;