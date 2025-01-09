use e_commerce_dbms;

-- // COMPUTER PARTS ///////////////////////////////////////////////////////////////
-- Processors
INSERT INTO products (name, description, price, brand, model, category_id) VALUES
('AMD Ryzen 5 5600X', '6-core processor for gaming and everyday tasks', 199.99, "AMD", "Ryzen 5 5600X", (SELECT id FROM categories WHERE name = 'Processor')),
('Intel Core i7-13700K', 'High-performance processor for gaming and content creation', 429.99, "Intel", "Core i7-13700K", (SELECT id FROM categories WHERE name = 'Processor')),
('AMD Ryzen 9 7950X3D', 'Extreme gaming processor with 3D V-Cache technology', 699.99, "AMD", "Ryzen 9 7950X3D", (SELECT id FROM categories WHERE name = 'Processor'));

INSERT INTO product_images (product_id, image_url, image_order, is_primary) VALUES
((SELECT id FROM products WHERE name = 'AMD Ryzen 5 5600X'), 'https://example.com/amd-ryzen-5600x-1.jpg', 1, true),
((SELECT id FROM products WHERE name = 'Intel Core i7-13700K'), 'https://example.com/intel-i7-13700k-1.jpg', 1, true),
((SELECT id FROM products WHERE name = 'AMD Ryzen 9 7950X3D'), 'https://example.com/amd-ryzen-7950x3d-1.jpg', 1, true);

INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'AMD Ryzen 5 5600X'), (SELECT id FROM attributes WHERE name = 'Generation' AND category_id = (SELECT id FROM categories WHERE name = 'Processor')), 'Ryzen 5000 Series'),
((SELECT id FROM products WHERE name = 'AMD Ryzen 5 5600X'), (SELECT id FROM attributes WHERE name = 'Socket Type' AND category_id = (SELECT id FROM categories WHERE name = 'Processor')), 'AM4'),
((SELECT id FROM products WHERE name = 'AMD Ryzen 5 5600X'), (SELECT id FROM attributes WHERE name = 'Frequency Speed' AND category_id = (SELECT id FROM categories WHERE name = 'Processor')), '3.7 GHz'),
((SELECT id FROM products WHERE name = 'AMD Ryzen 5 5600X'), (SELECT id FROM attributes WHERE name = 'Core Count' AND category_id = (SELECT id FROM categories WHERE name = 'Processor')), '6'),
((SELECT id FROM products WHERE name = 'Intel Core i7-13700K'), (SELECT id FROM attributes WHERE name = 'Generation' AND category_id = (SELECT id FROM categories WHERE name = 'Processor')), '13th Gen'),
((SELECT id FROM products WHERE name = 'Intel Core i7-13700K'), (SELECT id FROM attributes WHERE name = 'Socket Type' AND category_id = (SELECT id FROM categories WHERE name = 'Processor')), 'LGA 1700'),
((SELECT id FROM products WHERE name = 'Intel Core i7-13700K'), (SELECT id FROM attributes WHERE name = 'Frequency Speed' AND category_id = (SELECT id FROM categories WHERE name = 'Processor')), '5.4 GHz'),
((SELECT id FROM products WHERE name = 'Intel Core i7-13700K'), (SELECT id FROM attributes WHERE name = 'Core Count' AND category_id = (SELECT id FROM categories WHERE name = 'Processor')), '16'),
((SELECT id FROM products WHERE name = 'AMD Ryzen 9 7950X3D'), (SELECT id FROM attributes WHERE name = 'Generation' AND category_id = (SELECT id FROM categories WHERE name = 'Processor')), 'Ryzen 7000 Series'),
((SELECT id FROM products WHERE name = 'AMD Ryzen 9 7950X3D'), (SELECT id FROM attributes WHERE name = 'Socket Type' AND category_id = (SELECT id FROM categories WHERE name = 'Processor')), 'AM5'),
((SELECT id FROM products WHERE name = 'AMD Ryzen 9 7950X3D'), (SELECT id FROM attributes WHERE name = 'Frequency Speed' AND category_id = (SELECT id FROM categories WHERE name = 'Processor')), '4.2 GHz'),
((SELECT id FROM products WHERE name = 'AMD Ryzen 9 7950X3D'), (SELECT id FROM attributes WHERE name = 'Core Count' AND category_id = (SELECT id FROM categories WHERE name = 'Processor')), '16');

-- Motherboards
INSERT INTO products (name, description, price, brand, model, category_id) VALUES
('ASRock Z790 Taichi', 'Premium motherboard with advanced VRM and features', 550.00, "ASRock", "Z790 Taichi", (SELECT id FROM categories WHERE name = 'Motherboard')),
('Gigabyte B650 AORUS Elite AX', 'Solid motherboard for AMD Ryzen 7000 series', 300.00, "Gigabyte", "B650 AORUS Elite AX", (SELECT id FROM categories WHERE name = 'Motherboard')),
('ASUS ROG Strix B650E-E Gaming WiFi', 'High-end motherboard for AMD Ryzen 7000 series', 450.00, "ASUS", "ROG Strix B650E-E", (SELECT id FROM categories WHERE name = 'Motherboard'));

INSERT INTO product_images (product_id, image_url, image_order, is_primary) VALUES
((SELECT id FROM products WHERE name = 'ASRock Z790 Taichi'), 'https://example.com/asrock-z790-taichi-1.jpg', 1, true),
((SELECT id FROM products WHERE name = 'Gigabyte B650 AORUS Elite AX'), 'https://example.com/gigabyte-b650-aorus-1.jpg', 1, true),
((SELECT id FROM products WHERE name = 'ASUS ROG Strix B650E-E Gaming WiFi'), 'https://example.com/asus-rog-b650e-1.jpg', 1, true);

INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'ASRock Z790 Taichi'), (SELECT id FROM attributes WHERE name = 'Processor Type' AND category_id = (SELECT id FROM categories WHERE name = 'Motherboard')), 'Intel 13th Gen'),
((SELECT id FROM products WHERE name = 'ASRock Z790 Taichi'), (SELECT id FROM attributes WHERE name = 'Socket Type' AND category_id = (SELECT id FROM categories WHERE name = 'Motherboard')), 'LGA 1700'),
((SELECT id FROM products WHERE name = 'ASRock Z790 Taichi'), (SELECT id FROM attributes WHERE name = 'Ram Type' AND category_id = (SELECT id FROM categories WHERE name = 'Motherboard')), 'DDR5'),
((SELECT id FROM products WHERE name = 'ASRock Z790 Taichi'), (SELECT id FROM attributes WHERE name = 'Ram Slot Count' AND category_id = (SELECT id FROM categories WHERE name = 'Motherboard')), '4'),
((SELECT id FROM products WHERE name = 'ASRock Z790 Taichi'), (SELECT id FROM attributes WHERE name = 'Size' AND category_id = (SELECT id FROM categories WHERE name = 'Motherboard')), 'ATX'),
((SELECT id FROM products WHERE name = 'Gigabyte B650 AORUS Elite AX'), (SELECT id FROM attributes WHERE name = 'Processor Type' AND category_id = (SELECT id FROM categories WHERE name = 'Motherboard')), 'AMD Ryzen 7000'),
((SELECT id FROM products WHERE name = 'Gigabyte B650 AORUS Elite AX'), (SELECT id FROM attributes WHERE name = 'Socket Type' AND category_id = (SELECT id FROM categories WHERE name = 'Motherboard')), 'AM5'),
((SELECT id FROM products WHERE name = 'Gigabyte B650 AORUS Elite AX'), (SELECT id FROM attributes WHERE name = 'Ram Type' AND category_id = (SELECT id FROM categories WHERE name = 'Motherboard')), 'DDR5'),
((SELECT id FROM products WHERE name = 'Gigabyte B650 AORUS Elite AX'), (SELECT id FROM attributes WHERE name = 'Ram Slot Count' AND category_id = (SELECT id FROM categories WHERE name = 'Motherboard')), '4'),
((SELECT id FROM products WHERE name = 'Gigabyte B650 AORUS Elite AX'), (SELECT id FROM attributes WHERE name = 'Size' AND category_id = (SELECT id FROM categories WHERE name = 'Motherboard')), 'ATX'),
((SELECT id FROM products WHERE name = 'ASUS ROG Strix B650E-E Gaming WiFi'), (SELECT id FROM attributes WHERE name = 'Processor Type' AND category_id = (SELECT id FROM categories WHERE name = 'Motherboard')), 'AMD Ryzen 7000'),
((SELECT id FROM products WHERE name = 'ASUS ROG Strix B650E-E Gaming WiFi'), (SELECT id FROM attributes WHERE name = 'Socket Type' AND category_id = (SELECT id FROM categories WHERE name = 'Motherboard')), 'AM5'),
((SELECT id FROM products WHERE name = 'ASUS ROG Strix B650E-E Gaming WiFi'), (SELECT id FROM attributes WHERE name = 'Ram Type' AND category_id = (SELECT id FROM categories WHERE name = 'Motherboard')), 'DDR5'),
((SELECT id FROM products WHERE name = 'ASUS ROG Strix B650E-E Gaming WiFi'), (SELECT id FROM attributes WHERE name = 'Ram Slot Count' AND category_id = (SELECT id FROM categories WHERE name = 'Motherboard')), '4'),
((SELECT id FROM products WHERE name = 'ASUS ROG Strix B650E-E Gaming WiFi'), (SELECT id FROM attributes WHERE name = 'Size' AND category_id = (SELECT id FROM categories WHERE name = 'Motherboard')), 'ATX');

-- RAMs
INSERT INTO products (name, description, price, brand, model, category_id) VALUES
('Crucial Ballistix 32GB (2x16GB) DDR4 3600MHz', '32GB gaming RAM kit', 129.99, "Crucial", "BL2K16G36C16U4B", (SELECT id FROM categories WHERE name = 'RAM')),
('Kingston Fury Beast 16GB (2x8GB) DDR5 5200MHz', '16GB DDR5 RAM kit for high-end systems', 119.99, "Kingston", "KF552C40BBK2-16", (SELECT id FROM categories WHERE name = 'RAM')),
('Corsair Dominator Platinum RGB 32GB (2x16GB) DDR5 5600MHz', 'Premium 32GB DDR5 RAM kit', 299.99, "Corsair", "CMT32GX5M2X5600C36", (SELECT id FROM categories WHERE name = 'RAM'));

INSERT INTO product_images (product_id, image_url, image_order, is_primary) VALUES
((SELECT id FROM products WHERE name = 'Crucial Ballistix 32GB (2x16GB) DDR4 3600MHz'), 'https://example.com/crucial-ballistix-1.jpg', 1, true),
((SELECT id FROM products WHERE name = 'Kingston Fury Beast 16GB (2x8GB) DDR5 5200MHz'), 'https://example.com/kingston-fury-1.jpg', 1, true),
((SELECT id FROM products WHERE name = 'Corsair Dominator Platinum RGB 32GB (2x16GB) DDR5 5600MHz'), 'https://example.com/corsair-dominator-1.jpg', 1, true);

INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'Crucial Ballistix 32GB (2x16GB) DDR4 3600MHz'), (SELECT id FROM attributes WHERE name = 'Ram Capacity' AND category_id = (SELECT id FROM categories WHERE name = 'RAM')), '32GB'),
((SELECT id FROM products WHERE name = 'Crucial Ballistix 32GB (2x16GB) DDR4 3600MHz'), (SELECT id FROM attributes WHERE name = 'Frequency Speed' AND category_id = (SELECT id FROM categories WHERE name = 'RAM')), '3600MHz'),
((SELECT id FROM products WHERE name = 'Crucial Ballistix 32GB (2x16GB) DDR4 3600MHz'), (SELECT id FROM attributes WHERE name = 'Ram Type' AND category_id = (SELECT id FROM categories WHERE name = 'RAM')), 'DDR4'),
((SELECT id FROM products WHERE name = 'Kingston Fury Beast 16GB (2x8GB) DDR5 5200MHz'), (SELECT id FROM attributes WHERE name = 'Ram Capacity' AND category_id = (SELECT id FROM categories WHERE name = 'RAM')), '16GB'),
((SELECT id FROM products WHERE name = 'Kingston Fury Beast 16GB (2x8GB) DDR5 5200MHz'), (SELECT id FROM attributes WHERE name = 'Frequency Speed' AND category_id = (SELECT id FROM categories WHERE name = 'RAM')), '5200MHz'),
((SELECT id FROM products WHERE name = 'Kingston Fury Beast 16GB (2x8GB) DDR5 5200MHz'), (SELECT id FROM attributes WHERE name = 'Ram Type' AND category_id = (SELECT id FROM categories WHERE name = 'RAM')), 'DDR5'),
((SELECT id FROM products WHERE name = 'Corsair Dominator Platinum RGB 32GB (2x16GB) DDR5 5600MHz'), (SELECT id FROM attributes WHERE name = 'Ram Capacity' AND category_id = (SELECT id FROM categories WHERE name = 'RAM')), '32GB'),
((SELECT id FROM products WHERE name = 'Corsair Dominator Platinum RGB 32GB (2x16GB) DDR5 5600MHz'), (SELECT id FROM attributes WHERE name = 'Frequency Speed' AND category_id = (SELECT id FROM categories WHERE name = 'RAM')), '5600MHz'),
((SELECT id FROM products WHERE name = 'Corsair Dominator Platinum RGB 32GB (2x16GB) DDR5 5600MHz'), (SELECT id FROM attributes WHERE name = 'Ram Type' AND category_id = (SELECT id FROM categories WHERE name = 'RAM')), 'DDR5');

-- Graphic Cards
INSERT INTO products (name, description, price, brand, model, category_id) VALUES
('NVIDIA GeForce RTX 4070 Ti', 'High-performance graphics card', 799.99, "NVIDIA", "RTX 4070 Ti", (SELECT id FROM categories WHERE name = 'Graphic Card')),
('AMD Radeon RX 7800 XT', 'Graphics card for 1440p gaming', 549.99, "AMD", "RX 7800 XT", (SELECT id FROM categories WHERE name = 'Graphic Card')),
('NVIDIA GeForce RTX 3060 Ti', 'Popular graphics card for 1080p and 1440p gaming', 399.99, "NVIDIA", "RTX 3060 Ti", (SELECT id FROM categories WHERE name = 'Graphic Card'));

INSERT INTO product_images (product_id, image_url, image_order, is_primary) VALUES
((SELECT id FROM products WHERE name = 'NVIDIA GeForce RTX 4070 Ti'), 'https://example.com/nvidia-rtx-4070ti-1.jpg', 1, true),
((SELECT id FROM products WHERE name = 'AMD Radeon RX 7800 XT'), 'https://example.com/amd-rx-7800xt-1.jpg', 1, true),
((SELECT id FROM products WHERE name = 'NVIDIA GeForce RTX 3060 Ti'), 'https://example.com/nvidia-rtx-3060ti-1.jpg', 1, true);

INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'NVIDIA GeForce RTX 4070 Ti'), (SELECT id FROM attributes WHERE name = 'GPU Producer' AND category_id = (SELECT id FROM categories WHERE name = 'Graphic Card')), 'NVIDIA'),
((SELECT id FROM products WHERE name = 'NVIDIA GeForce RTX 4070 Ti'), (SELECT id FROM attributes WHERE name = 'VRAM' AND category_id = (SELECT id FROM categories WHERE name = 'Graphic Card')), '12GB'),
((SELECT id FROM products WHERE name = 'NVIDIA GeForce RTX 4070 Ti'), (SELECT id FROM attributes WHERE name = 'Memory Type' AND category_id = (SELECT id FROM categories WHERE name = 'Graphic Card')), 'GDDR6X'),
((SELECT id FROM products WHERE name = 'AMD Radeon RX 7800 XT'), (SELECT id FROM attributes WHERE name = 'GPU Producer' AND category_id = (SELECT id FROM categories WHERE name = 'Graphic Card')), 'AMD'),
((SELECT id FROM products WHERE name = 'AMD Radeon RX 7800 XT'), (SELECT id FROM attributes WHERE name = 'VRAM' AND category_id = (SELECT id FROM categories WHERE name = 'Graphic Card')), '16GB'),
((SELECT id FROM products WHERE name = 'AMD Radeon RX 7800 XT'), (SELECT id FROM attributes WHERE name = 'Memory Type' AND category_id = (SELECT id FROM categories WHERE name = 'Graphic Card')), 'GDDR6'),
((SELECT id FROM products WHERE name = 'NVIDIA GeForce RTX 3060 Ti'), (SELECT id FROM attributes WHERE name = 'GPU Producer' AND category_id = (SELECT id FROM categories WHERE name = 'Graphic Card')), 'NVIDIA'),
((SELECT id FROM products WHERE name = 'NVIDIA GeForce RTX 3060 Ti'), (SELECT id FROM attributes WHERE name = 'VRAM' AND category_id = (SELECT id FROM categories WHERE name = 'Graphic Card')), '8GB'),
((SELECT id FROM products WHERE name = 'NVIDIA GeForce RTX 3060 Ti'), (SELECT id FROM attributes WHERE name = 'Memory Type' AND category_id = (SELECT id FROM categories WHERE name = 'Graphic Card')), 'GDDR6');

-- Computer Cases
INSERT INTO products (name, description, price, brand, model, category_id) VALUES
('NZXT H510 Flow', 'Compact mid-tower case with improved airflow', 89.99, "NZXT", "H510 Flow", (SELECT id FROM categories WHERE name = 'Computer Case')),
('Lian Li O11 Dynamic EVO', 'Stylish dual-chamber case with tempered glass', 149.99, "Lian Li", "O11 Dynamic EVO", (SELECT id FROM categories WHERE name = 'Computer Case')),
('be quiet! Pure Base 500DX', 'Mid-tower case with focus on silence and airflow', 109.99, "be quiet!", "Pure Base 500DX", (SELECT id FROM categories WHERE name = 'Computer Case'));

INSERT INTO product_images (product_id, image_url, image_order, is_primary) VALUES
((SELECT id FROM products WHERE name = 'NZXT H510 Flow'), 'https://example.com/nzxt-h510-flow-1.jpg', 1, true),
((SELECT id FROM products WHERE name = 'Lian Li O11 Dynamic EVO'), 'https://example.com/lianli-o11-evo-1.jpg', 1, true),
((SELECT id FROM products WHERE name = 'be quiet! Pure Base 500DX'), 'https://example.com/bequiet-500dx-1.jpg', 1, true);

INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'NZXT H510 Flow'), (SELECT id FROM attributes WHERE name = 'Motherboard Size' AND category_id = (SELECT id FROM categories WHERE name = 'Computer Case')), 'ATX, Micro-ATX, Mini-ITX'),
((SELECT id FROM products WHERE name = 'NZXT H510 Flow'), (SELECT id FROM attributes WHERE name = 'Material' AND category_id = (SELECT id FROM categories WHERE name = 'Computer Case')), 'Steel and Tempered Glass'),
((SELECT id FROM products WHERE name = 'Lian Li O11 Dynamic EVO'), (SELECT id FROM attributes WHERE name = 'Motherboard Size' AND category_id = (SELECT id FROM categories WHERE name = 'Computer Case')), 'ATX, Micro-ATX, Mini-ITX'),
((SELECT id FROM products WHERE name = 'Lian Li O11 Dynamic EVO'), (SELECT id FROM attributes WHERE name = 'Material' AND category_id = (SELECT id FROM categories WHERE name = 'Computer Case')), 'Aluminum and Tempered Glass'),
((SELECT id FROM products WHERE name = 'be quiet! Pure Base 500DX'), (SELECT id FROM attributes WHERE name = 'Motherboard Size' AND category_id = (SELECT id FROM categories WHERE name = 'Computer Case')), 'ATX, Micro-ATX, Mini-ITX'),
((SELECT id FROM products WHERE name = 'be quiet! Pure Base 500DX'), (SELECT id FROM attributes WHERE name = 'Material' AND category_id = (SELECT id FROM categories WHERE name = 'Computer Case')), 'Steel and Plastic');


-- Power Supplies
INSERT INTO products (name, description, price, brand, model, category_id) VALUES
('EVGA SuperNOVA 1000 G6', '1000W 80+ Gold fully modular power supply', 179.99, "EVGA", "SuperNOVA 1000 G6", (SELECT id FROM categories WHERE name = 'Power Supply')),
('Cooler Master MWE Gold 750 V2', '750W 80+ Gold fully modular power supply', 119.99, "Cooler Master", "MWE Gold 750 V2", (SELECT id FROM categories WHERE name = 'Power Supply')),
('Corsair HX1000', '1000W 80+ Platinum fully modular power supply', 249.99, "Corsair", "HX1000", (SELECT id FROM categories WHERE name = 'Power Supply'));

INSERT INTO product_images (product_id, image_url, image_order, is_primary) VALUES
((SELECT id FROM products WHERE name = 'EVGA SuperNOVA 1000 G6'), 'https://example.com/evga-supernova-1000g6-1.jpg', 1, true),
((SELECT id FROM products WHERE name = 'Cooler Master MWE Gold 750 V2'), 'https://example.com/coolermaster-mwe-750-1.jpg', 1, true),
((SELECT id FROM products WHERE name = 'Corsair HX1000'), 'https://example.com/corsair-hx1000-1.jpg', 1, true);

INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'EVGA SuperNOVA 1000 G6'), (SELECT id FROM attributes WHERE name = 'Wattage' AND category_id = (SELECT id FROM categories WHERE name = 'Power Supply')), '1000W'),
((SELECT id FROM products WHERE name = 'EVGA SuperNOVA 1000 G6'), (SELECT id FROM attributes WHERE name = 'Efficiency Rating' AND category_id = (SELECT id FROM categories WHERE name = 'Power Supply')), '80+ Gold'),
((SELECT id FROM products WHERE name = 'Cooler Master MWE Gold 750 V2'), (SELECT id FROM attributes WHERE name = 'Wattage' AND category_id = (SELECT id FROM categories WHERE name = 'Power Supply')), '750W'),
((SELECT id FROM products WHERE name = 'Cooler Master MWE Gold 750 V2'), (SELECT id FROM attributes WHERE name = 'Efficiency Rating' AND category_id = (SELECT id FROM categories WHERE name = 'Power Supply')), '80+ Gold'),
((SELECT id FROM products WHERE name = 'Corsair HX1000'), (SELECT id FROM attributes WHERE name = 'Wattage' AND category_id = (SELECT id FROM categories WHERE name = 'Power Supply')), '1000W'),
((SELECT id FROM products WHERE name = 'Corsair HX1000'), (SELECT id FROM attributes WHERE name = 'Efficiency Rating' AND category_id = (SELECT id FROM categories WHERE name = 'Power Supply')), '80+ Platinum');

-- // COMPUTERS ///////////////////////////////////////////////////////////////
-- Desktops
INSERT INTO products (name, description, price, brand, model, category_id) VALUES
('iBUYPOWER SlateMR Gaming PC', 'Gaming PC with RTX 4070', 1999.99, "iBUYPOWER", "SlateMR", (SELECT id FROM categories WHERE name = 'Desktop')),
('CyberpowerPC Gamer Xtreme VR', 'VR-ready gaming PC with liquid cooling', 1799.99, "CyberpowerPC", "Gamer Xtreme VR", (SELECT id FROM categories WHERE name = 'Desktop')),
('Alienware Aurora R15', 'High-performance gaming desktop with unique design', 2799.99, "Alienware", "Aurora R15", (SELECT id FROM categories WHERE name = 'Desktop'));

INSERT INTO product_images (product_id, image_url, image_order, is_primary) VALUES
((SELECT id FROM products WHERE name = 'iBUYPOWER SlateMR Gaming PC'), 'https://example.com/ibuypower-slatemr-1.jpg', 1, true),
((SELECT id FROM products WHERE name = 'CyberpowerPC Gamer Xtreme VR'), 'https://example.com/cyberpowerpc-gamer-xtreme-1.jpg', 1, true),
((SELECT id FROM products WHERE name = 'Alienware Aurora R15'), 'https://example.com/alienware-aurora-r15-1.jpg', 1, true);

INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'iBUYPOWER SlateMR Gaming PC'), (SELECT id FROM attributes WHERE name = 'Processor Brand' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'Intel'),
((SELECT id FROM products WHERE name = 'iBUYPOWER SlateMR Gaming PC'), (SELECT id FROM attributes WHERE name = 'Processor Model' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'Core i7-13700K'),
((SELECT id FROM products WHERE name = 'iBUYPOWER SlateMR Gaming PC'), (SELECT id FROM attributes WHERE name = 'GPU Producer' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'NVIDIA'),
((SELECT id FROM products WHERE name = 'iBUYPOWER SlateMR Gaming PC'), (SELECT id FROM attributes WHERE name = 'GPU Model' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'RTX 4070'),
((SELECT id FROM products WHERE name = 'iBUYPOWER SlateMR Gaming PC'), (SELECT id FROM attributes WHERE name = 'Ram Capacity' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), '32GB'),
((SELECT id FROM products WHERE name = 'iBUYPOWER SlateMR Gaming PC'), (SELECT id FROM attributes WHERE name = 'SSD Capacity' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), '1TB'),
((SELECT id FROM products WHERE name = 'CyberpowerPC Gamer Xtreme VR'), (SELECT id FROM attributes WHERE name = 'Processor Brand' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'AMD'),
((SELECT id FROM products WHERE name = 'CyberpowerPC Gamer Xtreme VR'), (SELECT id FROM attributes WHERE name = 'Processor Model' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'Ryzen 7 7700X'),
((SELECT id FROM products WHERE name = 'CyberpowerPC Gamer Xtreme VR'), (SELECT id FROM attributes WHERE name = 'GPU Producer' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'NVIDIA'),
((SELECT id FROM products WHERE name = 'CyberpowerPC Gamer Xtreme VR'), (SELECT id FROM attributes WHERE name = 'GPU Model' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'RTX 3070'),
((SELECT id FROM products WHERE name = 'CyberpowerPC Gamer Xtreme VR'), (SELECT id FROM attributes WHERE name = 'Ram Capacity' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), '16GB'),
((SELECT id FROM products WHERE name = 'CyberpowerPC Gamer Xtreme VR'), (SELECT id FROM attributes WHERE name = 'SSD Capacity' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), '500GB'),
((SELECT id FROM products WHERE name = 'Alienware Aurora R15'), (SELECT id FROM attributes WHERE name = 'Processor Brand' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'Intel'),
((SELECT id FROM products WHERE name = 'Alienware Aurora R15'), (SELECT id FROM attributes WHERE name = 'Processor Model' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'Core i9-13900KF'),
((SELECT id FROM products WHERE name = 'Alienware Aurora R15'), (SELECT id FROM attributes WHERE name = 'GPU Producer' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'NVIDIA'),
((SELECT id FROM products WHERE name = 'Alienware Aurora R15'), (SELECT id FROM attributes WHERE name = 'GPU Model' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'RTX 4080'),
((SELECT id FROM products WHERE name = 'Alienware Aurora R15'), (SELECT id FROM attributes WHERE name = 'Ram Capacity' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), '64GB'),
((SELECT id FROM products WHERE name = 'Alienware Aurora R15'), (SELECT id FROM attributes WHERE name = 'SSD Capacity' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), '2TB');


-- Laptops
INSERT INTO products (name, description, price, brand, model, category_id) VALUES
('Dell XPS 15', 'Premium laptop for professionals and creators', 1999.99, "Dell", "XPS 15", (SELECT id FROM categories WHERE name = 'Laptop')),
('HP Spectre x360 14', '2-in-1 convertible laptop with touch display', 1499.99, "HP", "Spectre x360 14", (SELECT id FROM categories WHERE name = 'Laptop')),
('Lenovo Legion Pro 7i', 'High-performance gaming laptop with RTX 4080', 2799.99, "Lenovo", "Legion Pro 7i", (SELECT id FROM categories WHERE name = 'Laptop'));

INSERT INTO product_images (product_id, image_url, image_order, is_primary) VALUES
((SELECT id FROM products WHERE name = 'Dell XPS 15'), 'https://example.com/dell-xps-15-1.jpg', 1, true),
((SELECT id FROM products WHERE name = 'HP Spectre x360 14'), 'https://example.com/hp-spectre-x360-1.jpg', 1, true),
((SELECT id FROM products WHERE name = 'Lenovo Legion Pro 7i'), 'https://example.com/lenovo-legion-pro-7i-1.jpg', 1, true);

INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'Dell XPS 15'), (SELECT id FROM attributes WHERE name = 'Processor Brand' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'Intel'),
((SELECT id FROM products WHERE name = 'Dell XPS 15'), (SELECT id FROM attributes WHERE name = 'Processor Model' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'Core i7-13700H'),
((SELECT id FROM products WHERE name = 'Dell XPS 15'), (SELECT id FROM attributes WHERE name = 'GPU Producer' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'NVIDIA'),
((SELECT id FROM products WHERE name = 'Dell XPS 15'), (SELECT id FROM attributes WHERE name = 'GPU Model' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'RTX 4070'),
((SELECT id FROM products WHERE name = 'Dell XPS 15'), (SELECT id FROM attributes WHERE name = 'Ram Capacity' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), '32GB'),
((SELECT id FROM products WHERE name = 'Dell XPS 15'), (SELECT id FROM attributes WHERE name = 'SSD Capacity' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), '1TB'),
((SELECT id FROM products WHERE name = 'Dell XPS 15'), (SELECT id FROM attributes WHERE name = 'Screen Size' AND category_id = (SELECT id FROM categories WHERE name = 'Laptop')), '15.6 inch'),
((SELECT id FROM products WHERE name = 'HP Spectre x360 14'), (SELECT id FROM attributes WHERE name = 'Processor Brand' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'Intel'),
((SELECT id FROM products WHERE name = 'HP Spectre x360 14'), (SELECT id FROM attributes WHERE name = 'Processor Model' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'Core i7-1355U'),
((SELECT id FROM products WHERE name = 'HP Spectre x360 14'), (SELECT id FROM attributes WHERE name = 'GPU Producer' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'NVIDIA'),
((SELECT id FROM products WHERE name = 'HP Spectre x360 14'), (SELECT id FROM attributes WHERE name = 'GPU Model' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'RTX 4060'),
((SELECT id FROM products WHERE name = 'HP Spectre x360 14'), (SELECT id FROM attributes WHERE name = 'Ram Capacity' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), '16GB'),
((SELECT id FROM products WHERE name = 'HP Spectre x360 14'), (SELECT id FROM attributes WHERE name = 'SSD Capacity' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), '512GB'),
((SELECT id FROM products WHERE name = 'HP Spectre x360 14'), (SELECT id FROM attributes WHERE name = 'Screen Size' AND category_id = (SELECT id FROM categories WHERE name = 'Laptop')), '14 inch'),
((SELECT id FROM products WHERE name = 'Lenovo Legion Pro 7i'), (SELECT id FROM attributes WHERE name = 'Processor Brand' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'Intel'),
((SELECT id FROM products WHERE name = 'Lenovo Legion Pro 7i'), (SELECT id FROM attributes WHERE name = 'Processor Model' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'Core i9-13900HX'),
((SELECT id FROM products WHERE name = 'HP Spectre x360 14'), (SELECT id FROM attributes WHERE name = 'GPU Producer' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'NVIDIA'),
((SELECT id FROM products WHERE name = 'HP Spectre x360 14'), (SELECT id FROM attributes WHERE name = 'GPU Model' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), 'RTX 4080'),
((SELECT id FROM products WHERE name = 'Lenovo Legion Pro 7i'), (SELECT id FROM attributes WHERE name = 'Ram Capacity' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), '16GB'),
((SELECT id FROM products WHERE name = 'Lenovo Legion Pro 7i'), (SELECT id FROM attributes WHERE name = 'SSD Capacity' AND category_id = (SELECT id FROM categories WHERE name = 'Computers')), '1TB'),
((SELECT id FROM products WHERE name = 'Lenovo Legion Pro 7i'), (SELECT id FROM attributes WHERE name = 'Screen Size' AND category_id = (SELECT id FROM categories WHERE name = 'Laptop')), '17.8 inch');

-- // PERIPHERALS ///////////////////////////////////////////////////////////////
-- Monitors
INSERT INTO products (name, description, price, brand, model, category_id) VALUES
('Dell Alienware AW2723DF 27" QHD 240Hz Gaming Monitor', 'High-refresh rate gaming monitor with fast IPS panel', 599.99, "Dell", "AW2723DF", (SELECT id FROM categories WHERE name = 'Monitor')),
('ASUS ROG Swift PG32UQ 32" 4K 144Hz Gaming Monitor', '4K gaming monitor with HDMI 2.1', 899.99, "ASUS", "PG32UQ", (SELECT id FROM categories WHERE name = 'Monitor')),
('BenQ MOBIUZ EX2710Q 27" QHD 165Hz Gaming Monitor', 'QHD gaming monitor with built-in speakers', 349.99, "BenQ", "EX2710Q", (SELECT id FROM categories WHERE name = 'Monitor'));

INSERT INTO product_images (product_id, image_url, image_order, is_primary) VALUES
((SELECT id FROM products WHERE name = 'Dell Alienware AW2723DF 27" QHD 240Hz Gaming Monitor'), 'https://example.com/dell-aw2723df-1.jpg', 1, true),
((SELECT id FROM products WHERE name = 'ASUS ROG Swift PG32UQ 32" 4K 144Hz Gaming Monitor'), 'https://example.com/asus-pg32uq-1.jpg', 1, true),
((SELECT id FROM products WHERE name = 'BenQ MOBIUZ EX2710Q 27" QHD 165Hz Gaming Monitor'), 'https://example.com/benq-ex2710q-1.jpg', 1, true);

INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'Dell Alienware AW2723DF 27" QHD 240Hz Gaming Monitor'), (SELECT id FROM attributes WHERE name = 'Connectivity Type' AND category_id = (SELECT id FROM categories WHERE name = 'Peripherals')), 'HDMI, DisplayPort'),
((SELECT id FROM products WHERE name = 'Dell Alienware AW2723DF 27" QHD 240Hz Gaming Monitor'), (SELECT id FROM attributes WHERE name = 'Screen Size' AND category_id = (SELECT id FROM categories WHERE name = 'Monitor')), '27 Inch'),
((SELECT id FROM products WHERE name = 'Dell Alienware AW2723DF 27" QHD 240Hz Gaming Monitor'), (SELECT id FROM attributes WHERE name = 'Panel Type' AND category_id = (SELECT id FROM categories WHERE name = 'Monitor')), 'IPS'),
((SELECT id FROM products WHERE name = 'Dell Alienware AW2723DF 27" QHD 240Hz Gaming Monitor'), (SELECT id FROM attributes WHERE name = 'Resolution' AND category_id = (SELECT id FROM categories WHERE name = 'Monitor')), 'QHD (2560x1440)'),
((SELECT id FROM products WHERE name = 'Dell Alienware AW2723DF 27" QHD 240Hz Gaming Monitor'), (SELECT id FROM attributes WHERE name = 'Refresh Rate' AND category_id = (SELECT id FROM categories WHERE name = 'Monitor')), '240Hz'),
((SELECT id FROM products WHERE name = 'Dell Alienware AW2723DF 27" QHD 240Hz Gaming Monitor'), (SELECT id FROM attributes WHERE name = 'Response Time' AND category_id = (SELECT id FROM categories WHERE name = 'Monitor')), '1ms'),
((SELECT id FROM products WHERE name = 'ASUS ROG Swift PG32UQ 32" 4K 144Hz Gaming Monitor'), (SELECT id FROM attributes WHERE name = 'Connectivity Type' AND category_id = (SELECT id FROM categories WHERE name = 'Peripherals')), 'HDMI 2.1, DisplayPort'),
((SELECT id FROM products WHERE name = 'ASUS ROG Swift PG32UQ 32" 4K 144Hz Gaming Monitor'), (SELECT id FROM attributes WHERE name = 'Screen Size' AND category_id = (SELECT id FROM categories WHERE name = 'Monitor')), '32 Inch'),
((SELECT id FROM products WHERE name = 'ASUS ROG Swift PG32UQ 32" 4K 144Hz Gaming Monitor'), (SELECT id FROM attributes WHERE name = 'Panel Type' AND category_id = (SELECT id FROM categories WHERE name = 'Monitor')), 'IPS'),
((SELECT id FROM products WHERE name = 'ASUS ROG Swift PG32UQ 32" 4K 144Hz Gaming Monitor'), (SELECT id FROM attributes WHERE name = 'Resolution' AND category_id = (SELECT id FROM categories WHERE name = 'Monitor')), '4K (3840x2160)'),
((SELECT id FROM products WHERE name = 'ASUS ROG Swift PG32UQ 32" 4K 144Hz Gaming Monitor'), (SELECT id FROM attributes WHERE name = 'Refresh Rate' AND category_id = (SELECT id FROM categories WHERE name = 'Monitor')), '144Hz'),
((SELECT id FROM products WHERE name = 'ASUS ROG Swift PG32UQ 32" 4K 144Hz Gaming Monitor'), (SELECT id FROM attributes WHERE name = 'Response Time' AND category_id = (SELECT id FROM categories WHERE name = 'Monitor')), '1ms'),
((SELECT id FROM products WHERE name = 'BenQ MOBIUZ EX2710Q 27" QHD 165Hz Gaming Monitor'), (SELECT id FROM attributes WHERE name = 'Connectivity Type' AND category_id = (SELECT id FROM categories WHERE name = 'Peripherals')), 'HDMI, DisplayPort'),
((SELECT id FROM products WHERE name = 'BenQ MOBIUZ EX2710Q 27" QHD 165Hz Gaming Monitor'), (SELECT id FROM attributes WHERE name = 'Screen Size' AND category_id = (SELECT id FROM categories WHERE name = 'Monitor')), '27 Inch'),
((SELECT id FROM products WHERE name = 'BenQ MOBIUZ EX2710Q 27" QHD 165Hz Gaming Monitor'), (SELECT id FROM attributes WHERE name = 'Panel Type' AND category_id = (SELECT id FROM categories WHERE name = 'Monitor')), 'IPS'),
((SELECT id FROM products WHERE name = 'BenQ MOBIUZ EX2710Q 27" QHD 165Hz Gaming Monitor'), (SELECT id FROM attributes WHERE name = 'Resolution' AND category_id = (SELECT id FROM categories WHERE name = 'Monitor')), 'QHD (2560x1440)'),
((SELECT id FROM products WHERE name = 'BenQ MOBIUZ EX2710Q 27" QHD 165Hz Gaming Monitor'), (SELECT id FROM attributes WHERE name = 'Refresh Rate' AND category_id = (SELECT id FROM categories WHERE name = 'Monitor')), '165Hz'),
((SELECT id FROM products WHERE name = 'BenQ MOBIUZ EX2710Q 27" QHD 165Hz Gaming Monitor'), (SELECT id FROM attributes WHERE name = 'Response Time' AND category_id = (SELECT id FROM categories WHERE name = 'Monitor')), '1ms');

-- Keyboards
INSERT INTO products (name, description, price, brand, model, category_id) VALUES
('SteelSeries Apex Pro Mechanical Keyboard', 'Adjustable actuation mechanical keyboard', 199.99, "SteelSeries", "Apex Pro", (SELECT id FROM categories WHERE name = 'Keyboard')),
('HyperX Alloy Origins 60 Mechanical Keyboard', 'Compact 60% mechanical keyboard', 109.99, "HyperX", "Alloy Origins 60", (SELECT id FROM categories WHERE name = 'Keyboard')),
('Roccat Vulcan 121 AIMO Mechanical Keyboard', 'Gaming keyboard with aluminum top plate', 159.99, "Roccat", "Vulcan 121 AIMO", (SELECT id FROM categories WHERE name = 'Keyboard'));

INSERT INTO product_images (product_id, image_url, image_order, is_primary) VALUES
((SELECT id FROM products WHERE name = 'SteelSeries Apex Pro Mechanical Keyboard'), 'https://example.com/steelseries-apexpro-1.jpg', 1, true),
((SELECT id FROM products WHERE name = 'HyperX Alloy Origins 60 Mechanical Keyboard'), 'https://example.com/hyperx-alloy60-1.jpg', 1, true),
((SELECT id FROM products WHERE name = 'Roccat Vulcan 121 AIMO Mechanical Keyboard'), 'https://example.com/roccat-vulcan121-1.jpg', 1, true);

INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'SteelSeries Apex Pro Mechanical Keyboard'), (SELECT id FROM attributes WHERE name = 'Connectivity Type' AND category_id = (SELECT id FROM categories WHERE name = 'Peripherals')), 'USB'),
((SELECT id FROM products WHERE name = 'SteelSeries Apex Pro Mechanical Keyboard'), (SELECT id FROM attributes WHERE name = 'Key Layout' AND category_id = (SELECT id FROM categories WHERE name = 'Keyboard')), 'US'),
((SELECT id FROM products WHERE name = 'SteelSeries Apex Pro Mechanical Keyboard'), (SELECT id FROM attributes WHERE name = 'Keyboard Type' AND category_id = (SELECT id FROM categories WHERE name = 'Keyboard')), 'Mechanical'),
((SELECT id FROM products WHERE name = 'HyperX Alloy Origins 60 Mechanical Keyboard'), (SELECT id FROM attributes WHERE name = 'Connectivity Type' AND category_id = (SELECT id FROM categories WHERE name = 'Peripherals')), 'USB'),
((SELECT id FROM products WHERE name = 'HyperX Alloy Origins 60 Mechanical Keyboard'), (SELECT id FROM attributes WHERE name = 'Key Layout' AND category_id = (SELECT id FROM categories WHERE name = 'Keyboard')), 'US'),
((SELECT id FROM products WHERE name = 'HyperX Alloy Origins 60 Mechanical Keyboard'), (SELECT id FROM attributes WHERE name = 'Keyboard Type' AND category_id = (SELECT id FROM categories WHERE name = 'Keyboard')), 'Mechanical'),
((SELECT id FROM products WHERE name = 'Roccat Vulcan 121 AIMO Mechanical Keyboard'), (SELECT id FROM attributes WHERE name = 'Connectivity Type' AND category_id = (SELECT id FROM categories WHERE name = 'Peripherals')), 'USB'),
((SELECT id FROM products WHERE name = 'Roccat Vulcan 121 AIMO Mechanical Keyboard'), (SELECT id FROM attributes WHERE name = 'Key Layout' AND category_id = (SELECT id FROM categories WHERE name = 'Keyboard')), 'US'),
((SELECT id FROM products WHERE name = 'Roccat Vulcan 121 AIMO Mechanical Keyboard'), (SELECT id FROM attributes WHERE name = 'Keyboard Type' AND category_id = (SELECT id FROM categories WHERE name = 'Keyboard')), 'Mechanical');

-- Mouse
INSERT INTO products (name, description, price, brand, model, category_id) VALUES
('Logitech MX Master 3S Wireless Mouse', 'Premium wireless mouse for productivity', 99.99, "Logitech", "MX Master 3S", (SELECT id FROM categories WHERE name = 'Mouse')),
('Corsair Scimitar RGB Elite Gaming Mouse', 'Gaming mouse with 17 programmable buttons', 109.99, "Corsair", "Scimitar RGB Elite", (SELECT id FROM categories WHERE name = 'Mouse')),
('Razer Basilisk V3 Wired Gaming Mouse', 'Customizable gaming mouse with RGB', 69.99, "Razer", "Basilisk V3", (SELECT id FROM categories WHERE name = 'Mouse'));

INSERT INTO product_images (product_id, image_url, image_order, is_primary) VALUES
((SELECT id FROM products WHERE name = 'Logitech MX Master 3S Wireless Mouse'), 'https://example.com/logitech-mx-master-3s-1.jpg', 1, true),
((SELECT id FROM products WHERE name = 'Corsair Scimitar RGB Elite Gaming Mouse'), 'https://example.com/corsair-scimitar-1.jpg', 1, true),
((SELECT id FROM products WHERE name = 'Razer Basilisk V3 Wired Gaming Mouse'), 'https://example.com/razer-basilisk-v3-1.jpg', 1, true);


INSERT INTO attribute_values (product_id, attribute_id, value) VALUES
((SELECT id FROM products WHERE name = 'Logitech MX Master 3S Wireless Mouse'), (SELECT id FROM attributes WHERE name = 'Connectivity Type' AND category_id = (SELECT id FROM categories WHERE name = 'Peripherals')), 'Wireless'),
((SELECT id FROM products WHERE name = 'Logitech MX Master 3S Wireless Mouse'), (SELECT id FROM attributes WHERE name = 'Button Count' AND category_id = (SELECT id FROM categories WHERE name = 'Mouse')), '7'),
((SELECT id FROM products WHERE name = 'Logitech MX Master 3S Wireless Mouse'), (SELECT id FROM attributes WHERE name = 'Max DPI' AND category_id = (SELECT id FROM categories WHERE name = 'Mouse')), '8000'),
((SELECT id FROM products WHERE name = 'Corsair Scimitar RGB Elite Gaming Mouse'), (SELECT id FROM attributes WHERE name = 'Connectivity Type' AND category_id = (SELECT id FROM categories WHERE name = 'Peripherals')), 'USB'),
((SELECT id FROM products WHERE name = 'Corsair Scimitar RGB Elite Gaming Mouse'), (SELECT id FROM attributes WHERE name = 'Button Count' AND category_id = (SELECT id FROM categories WHERE name = 'Mouse')), '17'),
((SELECT id FROM products WHERE name = 'Corsair Scimitar RGB Elite Gaming Mouse'), (SELECT id FROM attributes WHERE name = 'Max DPI' AND category_id = (SELECT id FROM categories WHERE name = 'Mouse')), '18000'),
((SELECT id FROM products WHERE name = 'Razer Basilisk V3 Wired Gaming Mouse'), (SELECT id FROM attributes WHERE name = 'Connectivity Type' AND category_id = (SELECT id FROM categories WHERE name = 'Peripherals')), 'USB'),
((SELECT id FROM products WHERE name = 'Razer Basilisk V3 Wired Gaming Mouse'), (SELECT id FROM attributes WHERE name = 'Button Count' AND category_id = (SELECT id FROM categories WHERE name = 'Mouse')), '11'),
((SELECT id FROM products WHERE name = 'Razer Basilisk V3 Wired Gaming Mouse'), (SELECT id FROM attributes WHERE name = 'Max DPI' AND category_id = (SELECT id FROM categories WHERE name = 'Mouse')), '26000');

-- Add random quantities to new products (1-255)
UPDATE products
SET quantity = FLOOR(1 + RAND() * 254)
WHERE id > 37;