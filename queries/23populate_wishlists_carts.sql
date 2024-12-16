# /// WISHLISTS AND CARTS FOR EACH USER /////////////////////////////////////////////////

INSERT INTO wishlists (user_id) VALUES 
(1), (2), (3), (4), (5), (6), (7), (8);

INSERT INTO carts (user_id) VALUES 
(1), (2), (3), (4), (5), (6), (7), (8);

UPDATE users SET wishlist_id = 1, cart_id = 1 WHERE id = 1;
UPDATE users SET wishlist_id = 2, cart_id = 2 WHERE id = 2;
UPDATE users SET wishlist_id = 3, cart_id = 3 WHERE id = 3;
UPDATE users SET wishlist_id = 4, cart_id = 4 WHERE id = 4;
UPDATE users SET wishlist_id = 5, cart_id = 5 WHERE id = 5;
UPDATE users SET wishlist_id = 6, cart_id = 6 WHERE id = 6;
UPDATE users SET wishlist_id = 7, cart_id = 7 WHERE id = 7;
UPDATE users SET wishlist_id = 8, cart_id = 8 WHERE id = 8;

# /// RANDOM WISHLIST_ITEMS /////////////////////////////////////////////////

INSERT INTO wishlist_items (wishlist_id, product_id)
VALUES
-- Jane Doe's wishlist items (User ID 2)
(2, (SELECT id FROM products WHERE name = 'Corsair Vengeance LPX 16GB (2x8GB) DDR4 3200MHz')),
(2, (SELECT id FROM products WHERE name = 'AMD Ryzen 7 5800X')),

-- Bob Jones's wishlist items (User ID 3)
(3, (SELECT id FROM products WHERE name = 'NVIDIA GeForce RTX 4080')),
(3, (SELECT id FROM products WHERE name = 'Fractal Design Meshify 2')),

-- Mike Lee's wishlist items (User ID 5)
(5, (SELECT id FROM products WHERE name = 'Corsair RM850x (2021)')),

-- Emily White's wishlist items (User ID 6)
(6, (SELECT id FROM products WHERE name = 'SkyTech Blaze 3.0 Gaming PC')),
(6, (SELECT id FROM products WHERE name = 'MacBook Pro 16-inch')),

-- G4stly (Admin)'s wishlist items (User ID 8)
(8, (SELECT id FROM products WHERE name = 'Intel Core i9-12900K')),
(8, (SELECT id FROM products WHERE name = 'ASUS ROG Maximus Z790 Hero')),
(8, (SELECT id FROM products WHERE name = 'LG 27GL850-B 27" QHD IPS 144Hz Gaming Monitor')),
(8, (SELECT id FROM products WHERE name = 'Logitech G502 HERO High Performance Gaming Mouse')),
(8, (SELECT id FROM products WHERE name = 'Samsung Odyssey G9 49" DQHD 240Hz')),
(8, (SELECT id FROM products WHERE name = 'Logitech G915 TKL Wireless Gaming Keyboard'));


# /// RANDOM CART_ITEMS /////////////////////////////////////////////////

-- Insert cart items for each user
INSERT INTO cart_items (cart_id, quantity, product_id)
VALUES
-- John Doe's cart items (User ID 1)
(1, 1, (SELECT id FROM products WHERE name = 'Intel Core i9-12900K')),
(1, 2, (SELECT id FROM products WHERE name = 'MSI MPG Z790 Carbon WiFi')),
(1, 1, (SELECT id FROM products WHERE name = 'NVIDIA GeForce RTX 4080')),

-- Jane Doe's cart items (User ID 2)
(2, 1, (SELECT id FROM products WHERE name = 'Logitech G502 HERO High Performance Gaming Mouse')),
(2, 1, (SELECT id FROM products WHERE name = 'Corsair Vengeance LPX 16GB (2x8GB) DDR4 3200MHz')),

-- Alice Brown's cart items (User ID 4)
(4, 1, (SELECT id FROM products WHERE name = 'Fractal Design Meshify 2')),

-- Emily White's cart items (User ID 6)
(6, 1, (SELECT id FROM products WHERE name = 'SkyTech Blaze 3.0 Gaming PC')),

-- David Black's cart items (User ID 7)
(7, 1, (SELECT id FROM products WHERE name = 'Corsair Vengeance LPX 16GB (2x8GB) DDR4 3200MHz')),
(7, 2, (SELECT id FROM products WHERE name = 'Logitech G915 TKL Wireless Gaming Keyboard'));

