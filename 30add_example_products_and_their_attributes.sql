use e_commerce_dbms;

-- // COMPUTER PARTS ///////////////////////////////////////////////////////////////
-- Processors
INSERT INTO products (name, description, price, brand, model, category_id) VALUES
('AMD Ryzen 7 5800X', '8-core processor for gaming and productivity', 299.99, "AMD", "Ryzen 7 5800X", (SELECT id FROM categories WHERE name = 'Processor')),
('Intel Core i9-12900K', 'High-end desktop processor', 589.99, "Intel", "Core i9-12900K", (SELECT id FROM categories WHERE name = 'Processor'));

-- Add attribute values for Ryzen 7 5800X
INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'AMD Ryzen 7 5800X'), (SELECT id FROM attributes WHERE name = 'Generation' AND category_id = (SELECT id FROM categories WHERE name = 'Processor')), 'Ryzen 5000 Series'),
((SELECT id FROM products WHERE name = 'AMD Ryzen 7 5800X'), (SELECT id FROM attributes WHERE name = 'Socket Type' AND category_id = (SELECT id FROM categories WHERE name = 'Processor')), 'AM4'),
((SELECT id FROM products WHERE name = 'AMD Ryzen 7 5800X'), (SELECT id FROM attributes WHERE name = 'Frequency Speed' AND category_id = (SELECT id FROM categories WHERE name = 'Processor')), '3.8GHz'),
((SELECT id FROM products WHERE name = 'AMD Ryzen 7 5800X'), (SELECT id FROM attributes WHERE name = 'Core Count' AND category_id = (SELECT id FROM categories WHERE name = 'Processor')), '8');

-- Add attribute values for Intel Core i9-12900K
INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'Intel Core i9-12900K'), (SELECT id FROM attributes WHERE name = 'Generation' AND category_id = (SELECT id FROM categories WHERE name = 'Processor')), '12th Gen'),
((SELECT id FROM products WHERE name = 'Intel Core i9-12900K'), (SELECT id FROM attributes WHERE name = 'Socket Type' AND category_id = (SELECT id FROM categories WHERE name = 'Processor')), 'LGA 1700'),
((SELECT id FROM products WHERE name = 'Intel Core i9-12900K'), (SELECT id FROM attributes WHERE name = 'Frequency Speed' AND category_id = (SELECT id FROM categories WHERE name = 'Processor')), '5.2 GHz'),
((SELECT id FROM products WHERE name = 'Intel Core i9-12900K'), (SELECT id FROM attributes WHERE name = 'Core Count' AND category_id = (SELECT id FROM categories WHERE name = 'Processor')), '16');

-- Motherboards
INSERT INTO products (name, description, price, brand, model, category_id) VALUES
('ASUS ROG Maximus Z790 Hero', 'High-end motherboard for Intel 13th Gen CPUs', 600.00, "ASUS", "ROG Maximus Z790 Hero", (SELECT id FROM categories WHERE name = 'Motherboard')),
('MSI MPG Z790 Carbon WiFi', 'Feature-rich motherboard with WiFi 6E', 400.00, "MSI", "MPG Z790 Carbon WiFi", (SELECT id FROM categories WHERE name = 'Motherboard'));

-- Add attribute values for ASUS ROG Maximus Z790 Hero
INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'ASUS ROG Maximus Z790 Hero'), (SELECT id FROM attributes WHERE name = 'Processor Type' AND category_id = (SELECT id FROM categories WHERE name = 'Motherboard')), 'Intel 13th Gen'),
((SELECT id FROM products WHERE name = 'ASUS ROG Maximus Z790 Hero'), (SELECT id FROM attributes WHERE name = 'Socket Type' AND category_id = (SELECT id FROM categories WHERE name = 'Motherboard')), 'LGA 1700'),
((SELECT id FROM products WHERE name = 'ASUS ROG Maximus Z790 Hero'), (SELECT id FROM attributes WHERE name = 'Ram Type' AND category_id = (SELECT id FROM categories WHERE name = 'Motherboard')), 'DDR5'),
((SELECT id FROM products WHERE name = 'ASUS ROG Maximus Z790 Hero'), (SELECT id FROM attributes WHERE name = 'Ram Slot Count' AND category_id = (SELECT id FROM categories WHERE name = 'Motherboard')), '4'),
((SELECT id FROM products WHERE name = 'ASUS ROG Maximus Z790 Hero'), (SELECT id FROM attributes WHERE name = 'Size' AND category_id = (SELECT id FROM categories WHERE name = 'Motherboard')), 'ATX');


-- Add attribute values for MSI MPG Z790 Carbon WiFi
INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'MSI MPG Z790 Carbon WiFi'), (SELECT id FROM attributes WHERE name = 'Processor Type' AND category_id = (SELECT id FROM categories WHERE name = 'Motherboard')), 'Intel 13th Gen'),
((SELECT id FROM products WHERE name = 'MSI MPG Z790 Carbon WiFi'), (SELECT id FROM attributes WHERE name = 'Socket Type' AND category_id = (SELECT id FROM categories WHERE name = 'Motherboard')), 'LGA 1700'),
((SELECT id FROM products WHERE name = 'MSI MPG Z790 Carbon WiFi'), (SELECT id FROM attributes WHERE name = 'Ram Type' AND category_id = (SELECT id FROM categories WHERE name = 'Motherboard')), 'DDR5'),
((SELECT id FROM products WHERE name = 'MSI MPG Z790 Carbon WiFi'), (SELECT id FROM attributes WHERE name = 'Ram Slot Count' AND category_id = (SELECT id FROM categories WHERE name = 'Motherboard')), '4'),
((SELECT id FROM products WHERE name = 'MSI MPG Z790 Carbon WiFi'), (SELECT id FROM attributes WHERE name = 'Size' AND category_id = (SELECT id FROM categories WHERE name = 'Motherboard')), 'ATX');

-- RAMs
INSERT INTO products (name, description, price, brand, model, category_id) VALUES
('Corsair Vengeance LPX 16GB (2x8GB) DDR4 3200MHz', '16GB DDR4 RAM for gaming and general use', 79.99, "Corsair", "CMK16GX4M2B3200C16", (SELECT id FROM categories WHERE name = 'RAM')),
('G.Skill Trident Z Neo 32GB (2x16GB) DDR4 3600MHz', 'High-performance 32GB DDR4 RAM', 149.99, "G.Skill", "F4-3600C16D-32GTZN", (SELECT id FROM categories WHERE name = 'RAM'));

-- Add attribute values for Corsair Vengeance LPX
INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'Corsair Vengeance LPX 16GB (2x8GB) DDR4 3200MHz'), (SELECT id FROM attributes WHERE name = 'Ram Capacity' AND category_id = (SELECT id FROM categories WHERE name = 'RAM')), '16GB'),
((SELECT id FROM products WHERE name = 'Corsair Vengeance LPX 16GB (2x8GB) DDR4 3200MHz'), (SELECT id FROM attributes WHERE name = 'Frequency Speed' AND category_id = (SELECT id FROM categories WHERE name = 'RAM')), '3200MHz'),
((SELECT id FROM products WHERE name = 'Corsair Vengeance LPX 16GB (2x8GB) DDR4 3200MHz'), (SELECT id FROM attributes WHERE name = 'Ram Type' AND category_id = (SELECT id FROM categories WHERE name = 'RAM')), 'DDR4');

-- Add attribute values for G.Skill Trident Z Neo
INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'G.Skill Trident Z Neo 32GB (2x16GB) DDR4 3600MHz'), (SELECT id FROM attributes WHERE name = 'Ram Capacity' AND category_id = (SELECT id FROM categories WHERE name = 'RAM')), '32GB'),
((SELECT id FROM products WHERE name = 'G.Skill Trident Z Neo 32GB (2x16GB) DDR4 3600MHz'), (SELECT id FROM attributes WHERE name = 'Frequency Speed' AND category_id = (SELECT id FROM categories WHERE name = 'RAM')), '3600MHz'),
((SELECT id FROM products WHERE name = 'G.Skill Trident Z Neo 32GB (2x16GB) DDR4 3600MHz'), (SELECT id FROM attributes WHERE name = 'Ram Type' AND category_id = (SELECT id FROM categories WHERE name = 'RAM')), 'DDR4');

-- Graphic Cards
INSERT INTO products (name, description, price, brand, model, category_id) VALUES
('NVIDIA GeForce RTX 4080', 'High-end graphics card for 4K gaming', 1199.99, "NVIDIA", "RTX 4080", (SELECT id FROM categories WHERE name = 'Graphic Card')),
('AMD Radeon RX 7900 XTX', 'Powerful graphics card for 4K gaming', 999.99, "AMD", "RX 7900 XTX", (SELECT id FROM categories WHERE name = 'Graphic Card'));

-- Add attribute values for NVIDIA GeForce RTX 4080
INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'NVIDIA GeForce RTX 4080'), (SELECT id FROM attributes WHERE name = 'GPU Producer' AND category_id = (SELECT id FROM categories WHERE name = 'Graphic Card')), 'NVIDIA'),
((SELECT id FROM products WHERE name = 'NVIDIA GeForce RTX 4080'), (SELECT id FROM attributes WHERE name = 'VRAM' AND category_id = (SELECT id FROM categories WHERE name = 'Graphic Card')), '16GB'),
((SELECT id FROM products WHERE name = 'NVIDIA GeForce RTX 4080'), (SELECT id FROM attributes WHERE name = 'Memory Type' AND category_id = (SELECT id FROM categories WHERE name = 'Graphic Card')), 'GDDR6X');

-- Add attribute values for AMD Radeon RX 7900 XTX
INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'AMD Radeon RX 7900 XTX'), (SELECT id FROM attributes WHERE name = 'GPU Producer' AND category_id = (SELECT id FROM categories WHERE name = 'Graphic Card')), 'AMD'),
((SELECT id FROM products WHERE name = 'AMD Radeon RX 7900 XTX'), (SELECT id FROM attributes WHERE name = 'VRAM' AND category_id = (SELECT id FROM categories WHERE name = 'Graphic Card')), '24GB'),
((SELECT id FROM products WHERE name = 'AMD Radeon RX 7900 XTX'), (SELECT id FROM attributes WHERE name = 'Memory Type' AND category_id = (SELECT id FROM categories WHERE name = 'Graphic Card')), 'GDDR6');

-- Computer Cases
INSERT INTO products (name, description, price, brand, model, category_id) VALUES
('Corsair 4000D Airflow', 'Mid-tower ATX case with excellent airflow', 99.99, "Corsair", "4000D Airflow", (SELECT id FROM categories WHERE name = 'Computer Case')),
('Fractal Design Meshify 2', 'High-airflow ATX case with a minimalist design', 129.99, "Fractal Design", "Meshify 2", (SELECT id FROM categories WHERE name = 'Computer Case'));

-- Add attribute values for Corsair 4000D Airflow
INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'Corsair 4000D Airflow'), (SELECT id FROM attributes WHERE name = 'Motherboard Size' AND category_id = (SELECT id FROM categories WHERE name = 'Computer Case')), 'ATX'),
((SELECT id FROM products WHERE name = 'Corsair 4000D Airflow'), (SELECT id FROM attributes WHERE name = 'Material' AND category_id = (SELECT id FROM categories WHERE name = 'Computer Case')), 'Steel and Tempered Glass');

-- Add attribute values for Fractal Design Meshify 2
INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'Fractal Design Meshify 2'), (SELECT id FROM attributes WHERE name = 'Motherboard Size' AND category_id = (SELECT id FROM categories WHERE name = 'Computer Case')), 'ATX'),
((SELECT id FROM products WHERE name = 'Fractal Design Meshify 2'), (SELECT id FROM attributes WHERE name = 'Material' AND category_id = (SELECT id FROM categories WHERE name = 'Computer Case')), 'Steel and Tempered Glass');

-- Power Supplies
INSERT INTO products (name, description, price, brand, model, category_id) VALUES
('Corsair RM850x (2021)', '850W 80+ Gold fully modular power supply', 159.99, "Corsair", "RM850x (2021)", (SELECT id FROM categories WHERE name = 'Power Supply')),
('Seasonic FOCUS GX-750', '750W 80+ Gold fully modular power supply', 129.99, "Seasonic", "FOCUS GX-750", (SELECT id FROM categories WHERE name = 'Power Supply'));

-- Add attribute values for Corsair RM850x (2021)
INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'Corsair RM850x (2021)'), (SELECT id FROM attributes WHERE name = 'Wattage' AND category_id = (SELECT id FROM categories WHERE name = 'Power Supply')), '850W'),
((SELECT id FROM products WHERE name = 'Corsair RM850x (2021)'), (SELECT id FROM attributes WHERE name = 'Efficiency Rating' AND category_id = (SELECT id FROM categories WHERE name = 'Power Supply')), '80+ Gold');

-- Add attribute values for Seasonic FOCUS GX-750
INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'Seasonic FOCUS GX-750'), (SELECT id FROM attributes WHERE name = 'Wattage' AND category_id = (SELECT id FROM categories WHERE name = 'Power Supply')), '750W'),
((SELECT id FROM products WHERE name = 'Seasonic FOCUS GX-750'), (SELECT id FROM attributes WHERE name = 'Efficiency Rating' AND category_id = (SELECT id FROM categories WHERE name = 'Power Supply')), '80+ Gold');




-- // COMPUTERS ///////////////////////////////////////////////////////////////
-- Desktops
INSERT INTO products (name, description, price, brand, model, category_id) VALUES
('SkyTech Blaze 3.0 Gaming PC', 'Gaming desktop with RTX 3060', 1299.99, "SkyTech", "Blaze 3.0", (SELECT id FROM categories WHERE name = 'Desktop')),
('HP Omen 45L Gaming Desktop', 'High-end gaming PC with liquid cooling', 2499.99, "HP", "Omen 45L", (SELECT id FROM categories WHERE name = 'Desktop'));

-- Add attribute values for SkyTech Blaze 3.0
INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'SkyTech Blaze 3.0 Gaming PC'), (SELECT id FROM attributes WHERE name = 'Processor Brand' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'Intel'),
((SELECT id FROM products WHERE name = 'SkyTech Blaze 3.0 Gaming PC'), (SELECT id FROM attributes WHERE name = 'Processor Model' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'Core i5-11400F'),
((SELECT id FROM products WHERE name = 'SkyTech Blaze 3.0 Gaming PC'), (SELECT id FROM attributes WHERE name = 'GPU Producer' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'NVIDIA'),
((SELECT id FROM products WHERE name = 'SkyTech Blaze 3.0 Gaming PC'), (SELECT id FROM attributes WHERE name = 'GPU Model' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'RTX 3060'),
((SELECT id FROM products WHERE name = 'SkyTech Blaze 3.0 Gaming PC'), (SELECT id FROM attributes WHERE name = 'Ram Capacity' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), '16GB'),
((SELECT id FROM products WHERE name = 'SkyTech Blaze 3.0 Gaming PC'), (SELECT id FROM attributes WHERE name = 'SSD Capacity' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), '500GB');

-- Add attribute values for HP Omen 45L
INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'HP Omen 45L Gaming Desktop'), (SELECT id FROM attributes WHERE name = 'Processor Brand' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'Intel'),
((SELECT id FROM products WHERE name = 'HP Omen 45L Gaming Desktop'), (SELECT id FROM attributes WHERE name = 'Processor Model' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'Core i7-12700K'),
((SELECT id FROM products WHERE name = 'HP Omen 45L Gaming Desktop'), (SELECT id FROM attributes WHERE name = 'GPU Producer' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'NVIDIA'),
((SELECT id FROM products WHERE name = 'HP Omen 45L Gaming Desktop'), (SELECT id FROM attributes WHERE name = 'GPU Model' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'RTX 3080'),
((SELECT id FROM products WHERE name = 'HP Omen 45L Gaming Desktop'), (SELECT id FROM attributes WHERE name = 'Ram Capacity' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), '32GB'),
((SELECT id FROM products WHERE name = 'HP Omen 45L Gaming Desktop'), (SELECT id FROM attributes WHERE name = 'SSD Capacity' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), '1TB');

-- Laptops
INSERT INTO products (name, description, price, brand, model, category_id) VALUES
('MacBook Pro 16-inch', 'Powerful laptop with M2 Pro chip', 2499.99, "Apple", "MacBook Pro 16", (SELECT id FROM categories WHERE name = 'Laptop')),
('ASUS ROG Zephyrus G14', 'Gaming laptop with AMD Ryzen 9', 1799.99, "ASUS", "ROG Zephyrus G14", (SELECT id FROM categories WHERE name = 'Laptop'));

-- Add attribute values for MacBook Pro 16-inch
INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'MacBook Pro 16-inch'), (SELECT id FROM attributes WHERE name = 'Processor Brand' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'Apple'),
((SELECT id FROM products WHERE name = 'MacBook Pro 16-inch'), (SELECT id FROM attributes WHERE name = 'Processor Model' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'M2 Pro'),
((SELECT id FROM products WHERE name = 'MacBook Pro 16-inch'), (SELECT id FROM attributes WHERE name = 'Ram Capacity' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), '16GB'),
((SELECT id FROM products WHERE name = 'MacBook Pro 16-inch'), (SELECT id FROM attributes WHERE name = 'SSD Capacity' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), '1TB'),
((SELECT id FROM products WHERE name = 'MacBook Pro 16-inch'), (SELECT id FROM attributes WHERE name = 'Screen Size' AND category_id = (SELECT id FROM categories WHERE name = 'Laptop')), '16 inch');

-- Add attribute values for ASUS ROG Zephyrus G14
INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'ASUS ROG Zephyrus G14'), (SELECT id FROM attributes WHERE name = 'Processor Brand' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'AMD'),
((SELECT id FROM products WHERE name = 'ASUS ROG Zephyrus G14'), (SELECT id FROM attributes WHERE name = 'Processor Model' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'Ryzen 9 6900HS'),
((SELECT id FROM products WHERE name = 'ASUS ROG Zephyrus G14'), (SELECT id FROM attributes WHERE name = 'GPU Producer' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'NVIDIA'),  -- Assuming dedicated GPU
((SELECT id FROM products WHERE name = 'ASUS ROG Zephyrus G14'), (SELECT id FROM attributes WHERE name = 'GPU Model' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'RTX 3060'), -- Example GPU
((SELECT id FROM products WHERE name = 'ASUS ROG Zephyrus G14'), (SELECT id FROM attributes WHERE name = 'Ram Capacity' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), '16GB'),
((SELECT id FROM products WHERE name = 'ASUS ROG Zephyrus G14'), (SELECT id FROM attributes WHERE name = 'SSD Capacity' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), '1TB'),  -- Example SSD size
((SELECT id FROM products WHERE name = 'ASUS ROG Zephyrus G14'), (SELECT id FROM attributes WHERE name = 'Screen Size' AND category_id = (SELECT id FROM categories WHERE name = 'Laptop')), '14 inch');





-- // PERIPHERALS ///////////////////////////////////////////////////////////////
-- Monitors
INSERT INTO products (name, description, price, brand, model, category_id) VALUES
('LG 27GL850-B 27" QHD IPS 144Hz Gaming Monitor', '27-inch QHD gaming monitor', 399.99, "LG", "27GL850-B", (SELECT id FROM categories WHERE name = 'Monitor')),
('Samsung Odyssey G9 49" DQHD 240Hz', '49-inch ultrawide gaming monitor', 1499.99, "Samsung", "Odyssey G9", (SELECT id FROM categories WHERE name = 'Monitor'));

-- Add attribute values for LG 27GL850-B
INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'LG 27GL850-B 27" QHD IPS 144Hz Gaming Monitor'), (SELECT id FROM attributes WHERE name = 'Connectivity Type' AND category_id = (SELECT id FROM categories WHERE name = 'Peripherals')), 'HDMI, DisplayPort'),
((SELECT id FROM products WHERE name = 'LG 27GL850-B 27" QHD IPS 144Hz Gaming Monitor'), (SELECT id FROM attributes WHERE name = 'Screen Size' AND category_id = (SELECT id FROM categories WHERE name = 'Monitor')), '27 Inch'),
((SELECT id FROM products WHERE name = 'LG 27GL850-B 27" QHD IPS 144Hz Gaming Monitor'), (SELECT id FROM attributes WHERE name = 'Panel Type' AND category_id = (SELECT id FROM categories WHERE name = 'Monitor')), 'IPS'),
((SELECT id FROM products WHERE name = 'LG 27GL850-B 27" QHD IPS 144Hz Gaming Monitor'), (SELECT id FROM attributes WHERE name = 'Resolution' AND category_id = (SELECT id FROM categories WHERE name = 'Monitor')), 'QHD (2560x1440)'),
((SELECT id FROM products WHERE name = 'LG 27GL850-B 27" QHD IPS 144Hz Gaming Monitor'), (SELECT id FROM attributes WHERE name = 'Refresh Rate' AND category_id = (SELECT id FROM categories WHERE name = 'Monitor')), '144Hz'),
((SELECT id FROM products WHERE name = 'LG 27GL850-B 27" QHD IPS 144Hz Gaming Monitor'), (SELECT id FROM attributes WHERE name = 'Response Time' AND category_id = (SELECT id FROM categories WHERE name = 'Monitor')), '1ms');

-- Add attribute values for Samsung Odyssey G9
INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'Samsung Odyssey G9 49" DQHD 240Hz'), (SELECT id FROM attributes WHERE name = 'Connectivity Type' AND category_id = (SELECT id FROM categories WHERE name = 'Peripherals')), 'HDMI'),
((SELECT id FROM products WHERE name = 'Samsung Odyssey G9 49" DQHD 240Hz'), (SELECT id FROM attributes WHERE name = 'Screen Size' AND category_id = (SELECT id FROM categories WHERE name = 'Monitor')), '49 Inch'),
((SELECT id FROM products WHERE name = 'Samsung Odyssey G9 49" DQHD 240Hz'), (SELECT id FROM attributes WHERE name = 'Panel Type' AND category_id = (SELECT id FROM categories WHERE name = 'Monitor')), 'VA'),
((SELECT id FROM products WHERE name = 'Samsung Odyssey G9 49" DQHD 240Hz'), (SELECT id FROM attributes WHERE name = 'Resolution' AND category_id = (SELECT id FROM categories WHERE name = 'Monitor')), 'DQHD (5120x1440)'),
((SELECT id FROM products WHERE name = 'Samsung Odyssey G9 49" DQHD 240Hz'), (SELECT id FROM attributes WHERE name = 'Refresh Rate' AND category_id = (SELECT id FROM categories WHERE name = 'Monitor')), '240Hz'),
((SELECT id FROM products WHERE name = 'Samsung Odyssey G9 49" DQHD 240Hz'), (SELECT id FROM attributes WHERE name = 'Response Time' AND category_id = (SELECT id FROM categories WHERE name = 'Monitor')), '1ms');

-- Keyboards
INSERT INTO products (name, description, price, brand, model, category_id) VALUES
('Corsair K70 RGB MK.2 Mechanical Keyboard', 'Mechanical gaming keyboard with Cherry MX Brown switches', 129.99, "Corsair", "K70 RGB MK.2", (SELECT id FROM categories WHERE name = 'Keyboard')),
('Logitech G915 TKL Wireless Gaming Keyboard', 'Wireless keyboard with low-profile GL switches', 229.99, "Logitech", "G915 TKL", (SELECT id FROM categories WHERE name = 'Keyboard'));

-- Add attribute values for Corsair K70 RGB MK.2
INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'Corsair K70 RGB MK.2 Mechanical Keyboard'), (SELECT id FROM attributes WHERE name = 'Connectivity Type' AND category_id = (SELECT id FROM categories WHERE name = 'Peripherals')), 'USB'),
((SELECT id FROM products WHERE name = 'Corsair K70 RGB MK.2 Mechanical Keyboard'), (SELECT id FROM attributes WHERE name = 'Key Layout' AND category_id = (SELECT id FROM categories WHERE name = 'Keyboard')), 'US'),
((SELECT id FROM products WHERE name = 'Corsair K70 RGB MK.2 Mechanical Keyboard'), (SELECT id FROM attributes WHERE name = 'Keyboard Type' AND category_id = (SELECT id FROM categories WHERE name = 'Keyboard')), 'Mechanical');

-- Add attribute values for Logitech G915 TKL
INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'Logitech G915 TKL Wireless Gaming Keyboard'), (SELECT id FROM attributes WHERE name = 'Connectivity Type' AND category_id = (SELECT id FROM categories WHERE name = 'Peripherals')), 'Wireless'),
((SELECT id FROM products WHERE name = 'Logitech G915 TKL Wireless Gaming Keyboard'), (SELECT id FROM attributes WHERE name = 'Key Layout' AND category_id = (SELECT id FROM categories WHERE name = 'Keyboard')), 'TR'),
((SELECT id FROM products WHERE name = 'Logitech G915 TKL Wireless Gaming Keyboard'), (SELECT id FROM attributes WHERE name = 'Keyboard Type' AND category_id = (SELECT id FROM categories WHERE name = 'Keyboard')), 'Membrane');

-- Mouse
INSERT INTO products (name, description, price, brand, model, category_id) VALUES
('Logitech G502 HERO High Performance Gaming Mouse', 'Wired gaming mouse with adjustable weights', 79.99, "Logitech", "G502 HERO", (SELECT id FROM categories WHERE name = 'Mouse')),
('Razer DeathAdder V2 Pro Wireless Gaming Mouse', 'Wireless gaming mouse with ergonomic design', 129.99, "Razer", "DeathAdder V2 Pro", (SELECT id FROM categories WHERE name = 'Mouse'));

-- Add attribute values for Logitech G502 HERO
INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'Logitech G502 HERO High Performance Gaming Mouse'), (SELECT id FROM attributes WHERE name = 'Connectivity Type' AND category_id = (SELECT id FROM categories WHERE name = 'Peripherals')), 'USB'),
((SELECT id FROM products WHERE name = 'Logitech G502 HERO High Performance Gaming Mouse'), (SELECT id FROM attributes WHERE name = 'Button Count' AND category_id = (SELECT id FROM categories WHERE name = 'Mouse')), '11'),
((SELECT id FROM products WHERE name = 'Logitech G502 HERO High Performance Gaming Mouse'), (SELECT id FROM attributes WHERE name = 'Max DPI' AND category_id = (SELECT id FROM categories WHERE name = 'Mouse')), '25600');

-- Add attribute values for Razer DeathAdder V2 Pro
INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'Razer DeathAdder V2 Pro Wireless Gaming Mouse'), (SELECT id FROM attributes WHERE name = 'Connectivity Type' AND category_id = (SELECT id FROM categories WHERE name = 'Peripherals')), 'Wireless'),
((SELECT id FROM products WHERE name = 'Razer DeathAdder V2 Pro Wireless Gaming Mouse'), (SELECT id FROM attributes WHERE name = 'Button Count' AND category_id = (SELECT id FROM categories WHERE name = 'Mouse')), '8'),
((SELECT id FROM products WHERE name = 'Razer DeathAdder V2 Pro Wireless Gaming Mouse'), (SELECT id FROM attributes WHERE name = 'Max DPI' AND category_id = (SELECT id FROM categories WHERE name = 'Mouse')), '20000');