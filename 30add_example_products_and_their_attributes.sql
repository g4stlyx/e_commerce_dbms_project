use e_commerce_dbms;

-- // COMPUTER PARTS ///////////////////////////////////////////////////////////////////////////

-- Insert products for Motherboard subcategory
INSERT INTO products (name, price, stock_quantity, category_id, brand, model)
VALUES
('Gaming Motherboard X', 199.99, 20, (SELECT id FROM categories WHERE name = 'Motherboard'), 'MSI', 'B550 Gaming Plus'),
('Budget Motherboard Y', 99.99, 50, (SELECT id FROM categories WHERE name = 'Motherboard'), 'Gigabyte', 'A520M S2H');

-- Add attributes for Gaming Motherboard X
INSERT INTO product_attributes (product_id, attribute_id, value)
VALUES
((SELECT id FROM products WHERE name = 'Gaming Motherboard X'), (SELECT id FROM attributes WHERE name = 'Processor Type'), 'AMD Ryzen'),
((SELECT id FROM products WHERE name = 'Gaming Motherboard X'), (SELECT id FROM attributes WHERE name = 'Socket Type'), 'AM4'),
((SELECT id FROM products WHERE name = 'Gaming Motherboard X'), (SELECT id FROM attributes WHERE name = 'Ram Type'), 'DDR4'),
((SELECT id FROM products WHERE name = 'Gaming Motherboard X'), (SELECT id FROM attributes WHERE name = 'Ram Slot Count'), '4'),
((SELECT id FROM products WHERE name = 'Gaming Motherboard X'), (SELECT id FROM attributes WHERE name = 'Size'), 'ATX');

-- Add attributes for Budget Motherboard Y
INSERT INTO product_attributes (product_id, attribute_id, value)
VALUES
((SELECT id FROM products WHERE name = 'Budget Motherboard Y'), (SELECT id FROM attributes WHERE name = 'Processor Type'), 'Intel'),
((SELECT id FROM products WHERE name = 'Budget Motherboard Y'), (SELECT id FROM attributes WHERE name = 'Socket Type'), 'LGA1200'),
((SELECT id FROM products WHERE name = 'Budget Motherboard Y'), (SELECT id FROM attributes WHERE name = 'Ram Type'), 'DDR4'),
((SELECT id FROM products WHERE name = 'Budget Motherboard Y'), (SELECT id FROM attributes WHERE name = 'Ram Slot Count'), '2'),
((SELECT id FROM products WHERE name = 'Budget Motherboard Y'), (SELECT id FROM attributes WHERE name = 'Size'), 'Micro-ATX');

-- // COMPUTERS ////////////////////////////////////////////////////////////////

-- Insert products for Laptop subcategory
INSERT INTO products (name, price, stock_quantity, category_id, brand, model)
VALUES
('Ultrabook Pro', 999.99, 30, (SELECT id FROM categories WHERE name = 'Laptop'), 'Apple', 'MacBook Air M2'),
('Gaming Laptop Z', 1499.99, 15, (SELECT id FROM categories WHERE name = 'Laptop'), 'ASUS', 'ROG Zephyrus G15');

-- Add attributes for Ultrabook Pro
INSERT INTO product_attributes (product_id, attribute_id, value)
VALUES
((SELECT id FROM products WHERE name = 'Ultrabook Pro'), (SELECT id FROM attributes WHERE name = 'Laptop Screen Size'), '13.3'),
((SELECT id FROM products WHERE name = 'Ultrabook Pro'), (SELECT id FROM attributes WHERE name = 'Processor Type'), 'Apple M2'),
((SELECT id FROM products WHERE name = 'Ultrabook Pro'), (SELECT id FROM attributes WHERE name = 'Ram Type'), 'LPDDR5'),
((SELECT id FROM products WHERE name = 'Ultrabook Pro'), (SELECT id FROM attributes WHERE name = 'Storage Type'), 'SSD');

-- Add attributes for Gaming Laptop Z
INSERT INTO product_attributes (product_id, attribute_id, value)
VALUES
((SELECT id FROM products WHERE name = 'Gaming Laptop Z'), (SELECT id FROM attributes WHERE name = 'Laptop Screen Size'), '15.6'),
((SELECT id FROM products WHERE name = 'Gaming Laptop Z'), (SELECT id FROM attributes WHERE name = 'Processor Type'), 'AMD Ryzen 9'),
((SELECT id FROM products WHERE name = 'Gaming Laptop Z'), (SELECT id FROM attributes WHERE name = 'Ram Type'), 'DDR4'),
((SELECT id FROM products WHERE name = 'Gaming Laptop Z'), (SELECT id FROM attributes WHERE name = 'Storage Type'), 'NVMe SSD');

-- // Peripherals /////////////////////////////////////////////////////////////////////////

-- Insert products for Monitor subcategory
INSERT INTO products (name, price, stock_quantity, category_id, brand, model)
VALUES
('4K Monitor X', 299.99, 40, (SELECT id FROM categories WHERE name = 'Monitor'), 'Dell', 'U2723QE'),
('Gaming Monitor Y', 199.99, 60, (SELECT id FROM categories WHERE name = 'Monitor'), 'LG', 'UltraGear 27GP850');

-- Add attributes for 4K Monitor X
INSERT INTO product_attributes (product_id, attribute_id, value)
VALUES
((SELECT id FROM products WHERE name = '4K Monitor X'), (SELECT id FROM attributes WHERE name = 'Screen Size'), '27'),
((SELECT id FROM products WHERE name = '4K Monitor X'), (SELECT id FROM attributes WHERE name = 'Panel Type'), 'IPS'),
((SELECT id FROM products WHERE name = '4K Monitor X'), (SELECT id FROM attributes WHERE name = 'Resolution'), '4K'),
((SELECT id FROM products WHERE name = '4K Monitor X'), (SELECT id FROM attributes WHERE name = 'Refresh Rate'), '60Hz'),
((SELECT id FROM products WHERE name = '4K Monitor X'), (SELECT id FROM attributes WHERE name = 'Response Time'), '5ms');

-- Add attributes for Gaming Monitor Y
INSERT INTO product_attributes (product_id, attribute_id, value)
VALUES
((SELECT id FROM products WHERE name = 'Gaming Monitor Y'), (SELECT id FROM attributes WHERE name = 'Screen Size'), '27'),
((SELECT id FROM products WHERE name = 'Gaming Monitor Y'), (SELECT id FROM attributes WHERE name = 'Panel Type'), 'IPS'),
((SELECT id FROM products WHERE name = 'Gaming Monitor Y'), (SELECT id FROM attributes WHERE name = 'Resolution'), '1440p'),
((SELECT id FROM products WHERE name = 'Gaming Monitor Y'), (SELECT id FROM attributes WHERE name = 'Refresh Rate'), '144Hz'),
((SELECT id FROM products WHERE name = 'Gaming Monitor Y'), (SELECT id FROM attributes WHERE name = 'Response Time'), '1ms');

-- Insert products for Mouse subcategory
INSERT INTO products (name, price, stock_quantity, category_id, brand, model)
VALUES
('Wireless Mouse A', 29.99, 100, (SELECT id FROM categories WHERE name = 'Mouse'), 'Logitech', 'MX Anywhere 3'),
('Gaming Mouse B', 49.99, 50, (SELECT id FROM categories WHERE name = 'Mouse'), 'Razer', 'DeathAdder V2');

-- Add attributes for Wireless Mouse A
INSERT INTO product_attributes (product_id, attribute_id, value)
VALUES
((SELECT id FROM products WHERE name = 'Wireless Mouse A'), (SELECT id FROM attributes WHERE name = 'Connectivity Type'), 'Wireless'),
((SELECT id FROM products WHERE name = 'Wireless Mouse A'), (SELECT id FROM attributes WHERE name = 'Button Count'), '6'),
((SELECT id FROM products WHERE name = 'Wireless Mouse A'), (SELECT id FROM attributes WHERE name = 'Max DPI'), '1600');

-- Add attributes for Gaming Mouse B
INSERT INTO product_attributes (product_id, attribute_id, value)
VALUES
((SELECT id FROM products WHERE name = 'Gaming Mouse B'), (SELECT id FROM attributes WHERE name = 'Connectivity Type'), 'Wired'),
((SELECT id FROM products WHERE name = 'Gaming Mouse B'), (SELECT id FROM attributes WHERE name = 'Button Count'), '8'),
((SELECT id FROM products WHERE name = 'Gaming Mouse B'), (SELECT id FROM attributes WHERE name = 'Max DPI'), '20000');
