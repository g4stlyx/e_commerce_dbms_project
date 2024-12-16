# /// USERS /////////////////////////////////////////////////

INSERT INTO users (id, username, password, first_name, middle_initial, last_name, birth_date, is_admin, email, phone_number, address)
VALUES
(1, 'johndoe', 'password123', 'John', 'A', 'Doe', '1990-05-14', false, 'johndoe@example.com', '1234567890', '123 Main St, Springfield'),
(2, 'janedoe', 'password123', 'Jane', null, 'Doe', '1992-03-22', false, 'janedoe@example.com', '0987654321', '456 Elm St, Springfield'),
(3, 'bobjones', 'password123', 'Bob', 'C', 'Jones', '1989-08-09', false, 'bobjones@example.com', '1239874560', '789 Pine St, Springfield'),
(4, 'alicebrown', 'password123', 'Alice', null, 'Brown', '1998-12-01', false, 'alicebrown@example.com', '5678901234', '321 Oak St, Springfield'),
(5, 'mikelee', 'password123', 'Mike', 'D', 'Lee', '1970-07-15', false, 'mikelee@example.com', '3456789012', '654 Maple St, Springfield'),
(6, 'emilywhite', 'password123', 'Emily', 'E', 'White', '2005-11-20', false, 'emilywhite@example.com', '7890123456', '987 Birch St, Springfield'),
(7, 'davidblack', 'password123', 'David', null, 'Black', '1965-02-18', false, 'davidblack@example.com', '2345678901', '135 Cedar St, Springfield'),
(8, 'g4stly', 'adminpassword', 'G4stly', null, 'the Lord', '2003-01-01', true, 'g4stly@example.com', null, 'Silicon Valley');

# /// REVIEWS ////////////////////////////////////////////////

INSERT INTO reviews (id, rating, title, text, product_id, user_id)
VALUES
-- John Doe's reviews
(1, 5, 'ASUS ROG Maximus Z790 Hero', 'ASUS ROG Maximus Z790 Hero is incredibly fast and lightweight. Perfect for work and travel.', 
    (SELECT id FROM products WHERE name = 'ASUS ROG Maximus Z790 Hero'), 1),
(2, 4, 'Smooth Logitech G502', 'The Logitech MX Master 3 is very comfortable to use, though its battery life could be improved.', 
    (SELECT id FROM products WHERE name = 'Logitech G502 HERO High Performance Gaming Mouse'), 1),

-- Jane Doe's reviews
(3, 2, 'Razer DeathAdder V2', 'nah not good enough.', 
    (SELECT id FROM products WHERE name = 'Razer DeathAdder V2 Pro Wireless Gaming Mouse'), 2),
(4, 4, 'Sharp LG UltraGear Monitor', 'The LG UltraGear Monitor offers amazing color and clarity. Great value for the price.', 
    (SELECT id FROM products WHERE name = 'LG 27GL850-B 27" QHD IPS 144Hz Gaming Monitor'), 2),

-- Bob Jones' reviews
(5, 5, 'Outstanding NVIDIA RTX 3080', 'The NVIDIA RTX 3080 lets me play all my games on max settings with no lag. Worth every penny!', 
    (SELECT id FROM products WHERE name = 'NVIDIA GeForce RTX 4080'), 3),

-- Alice Brown's reviews
(6, 4, 'Fast and relatively cheap', 'Cool processor.', 
    (SELECT id FROM products WHERE name = 'AMD Ryzen 7 5800X'), 4),

-- Mike Lee's reviews
(7, 5, 'Powerful AMD Ryzen 9 5900X', 'The AMD Ryzen 9 5900X handles multitasking and gaming like a dream. Absolutely top-notch.', 
    (SELECT id FROM products WHERE name = 'AMD Ryzen 7 5800X'), 5),
(8, 4, 'Reliable Corsair RM850x Power Supply', 'The Corsair RM850x is quiet and efficient, but it’s slightly on the expensive side.', 
    (SELECT id FROM products WHERE name = 'Corsair RM850x (2021)'), 5),

-- Emily White's reviews
(9, 1, 'Didnt like it', 'Intel Core i9-12900K, extremely hard to keep it cool enough.', 
    (SELECT id FROM products WHERE name = 'Intel Core i9-12900K'), 6),

-- David Black's reviews
(10, 3, 'Functional VIVO Monitor', 'Samsung Odyssey G9 49" DQHD 240Hz works fine, but I expected a sturdier build.', 
    (SELECT id FROM products WHERE name = 'Samsung Odyssey G9 49" DQHD 240Hz'), 7),
(11, 5, 'High-Performance Corsair Vengeance RAM', 'The Corsair Vengeance RAM offers amazing speed and stability at a reasonable price.', 
    (SELECT id FROM products WHERE name = 'Corsair Vengeance LPX 16GB (2x8GB) DDR4 3200MHz'), 7);
    
    
# /// ORDERS AND ORDER ITEMS ///////////////////////////////////////////////////////////////

INSERT INTO orders (id, order_date, status, total_price, user_id)
VALUES
-- John Doe's orders
(1, '2024-12-01', 'DELIVERED', 299.99, 1),
(2, '2024-12-08', 'CREATED', 79.99, 1),

-- Jane Doe's orders
(3, '2024-12-02', 'DELIVERED', 379.99, 2),

-- Bob Jones' orders
(4, '2024-12-03', 'DELIVERED', 1599.99, 3),

-- Alice Brown's orders
(5, '2024-12-05', 'SHIPPED', 449.99, 4),

-- Mike Lee's orders
(6, '2024-12-06', 'DELIVERED', 529.99, 5),

-- Emily White's orders
(7, '2024-12-07', 'CANCELED', 649.99, 6),

-- David Black's orders
(8, '2024-12-10', 'CREATED', 499.99, 7);

INSERT INTO order_items (id, quantity, order_id, product_id)
VALUES
-- Order Items for John Doe
(1, 1, 1, (SELECT id FROM products WHERE name = 'ASUS ROG Maximus Z790 Hero')), -- Reviewed product
(2, 2, 1, (SELECT id FROM products WHERE name = 'Logitech G502 HERO High Performance Gaming Mouse')), -- Reviewed product
(3, 1, 2, (SELECT id FROM products WHERE name = 'Intel Core i9-12900K')), -- Non-reviewed product

-- Order Items for Jane Doe
(4, 1, 3, (SELECT id FROM products WHERE name = 'Razer DeathAdder V2 Pro Wireless Gaming Mouse')), -- Reviewed product
(5, 1, 3, (SELECT id FROM products WHERE name = 'LG 27GL850-B 27" QHD IPS 144Hz Gaming Monitor')), -- Reviewed product

-- Order Items for Bob Jones
(6, 1, 4, (SELECT id FROM products WHERE name = 'NVIDIA GeForce RTX 4080')), -- Reviewed product
(7, 1, 4, (SELECT id FROM products WHERE name = 'MSI MPG Z790 Carbon WiFi')), -- Non-reviewed product

-- Order Items for Alice Brown
(8, 1, 5, (SELECT id FROM products WHERE name = 'AMD Ryzen 7 5800X')), -- Reviewed product
(9, 1, 5, (SELECT id FROM products WHERE name = 'SkyTech Blaze 3.0 Gaming PC')), -- Non-reviewed product

-- Order Items for Mike Lee
(10, 1, 6, (SELECT id FROM products WHERE name = 'AMD Ryzen 7 5800X')), -- Reviewed product
(11, 2, 6, (SELECT id FROM products WHERE name = 'Corsair RM850x (2021)')), -- Reviewed product

-- Order Items for Emily White
(12, 1, 7, (SELECT id FROM products WHERE name = 'Intel Core i9-12900K')), -- Reviewed product
(13, 1, 7, (SELECT id FROM products WHERE name = 'G.Skill Trident Z Neo 32GB (2x16GB) DDR4 3600MHz')), -- Non-reviewed product

-- Order Items for David Black
(14, 1, 8, (SELECT id FROM products WHERE name = 'Samsung Odyssey G9 49" DQHD 240Hz')), -- Reviewed product
(15, 1, 8, (SELECT id FROM products WHERE name = 'Corsair Vengeance LPX 16GB (2x8GB) DDR4 3200MHz')); -- Reviewed product
