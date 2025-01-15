use e_commerce_dbms;

-- Insert main categories
INSERT INTO categories (name, description, parent_id) VALUES
('Computer Parts', 'Components and parts for building computers', NULL),
('Computers', 'desktop and laptop computers, ready to use', NULL),
('Peripherals', 'Computer peripherals and accessories', NULL);				# çevre birimleri

-- Insert subcategories for Computer Parts
-- why using two selects to get the category_id : https://stackoverflow.com/a/43610081/21996724 (if not: Error Code: 1093. You can't specify target table 'categories' for update in FROM clause)
INSERT INTO categories (name, description, parent_id) VALUES
('Processor', 'Central Processing Units (CPUs)', (SELECT * FROM (SELECT id FROM categories WHERE name = 'Computer Parts') as c)),
('Motherboard', 'Main circuit boards', (SELECT * FROM(SELECT id FROM categories WHERE name = 'Computer Parts') as c)),
('RAM', 'Random Access Memory modules', (SELECT * FROM(SELECT id FROM categories WHERE name = 'Computer Parts') as c)),
('Graphic Card', 'Graphics Processing Units (GPUs)', (SELECT * FROM(SELECT id FROM categories WHERE name = 'Computer Parts') as c)),
('Computer Case', 'PC Cases and chassis', (SELECT * FROM (SELECT id FROM categories WHERE name = 'Computer Parts')as c)),
('Power Supply', 'Power Supply Units (PSUs)', (SELECT * FROM (SELECT id FROM categories WHERE name = 'Computer Parts') as c));

-- Insert subcategories for Computers
-- why using two selects to get the category_id : https://stackoverflow.com/a/43610081/21996724 (if not: Error Code: 1093. You can't specify target table 'categories' for update in FROM clause)
INSERT INTO categories (name, description, parent_id) VALUES
('Laptop', 'Portable laptops and notebooks', (SELECT * FROM (SELECT id FROM categories WHERE name = 'Computers')as c)),
('Desktop', 'Desktop computers', (SELECT * FROM(SELECT id FROM categories WHERE name = 'Computers')as c));

-- Insert subcategories for Peripherals
-- why using two selects to get the category_id : https://stackoverflow.com/a/43610081/21996724 (if not: Error Code: 1093. You can't specify target table 'categories' for update in FROM clause)
INSERT INTO categories (name, description, parent_id) VALUES
('Monitor', 'Computer displays and monitors', (SELECT * FROM(SELECT id FROM categories WHERE name = 'Peripherals')as c)),
('Keyboard', 'Computer keyboards', (SELECT * FROM(SELECT id FROM categories WHERE name = 'Peripherals')as c)),
('Mouse', 'Computer mice and pointing devices', (SELECT * FROM(SELECT id FROM categories WHERE name = 'Peripherals')as c));

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
('Frequency Speed', (SELECT id FROM categories WHERE name = 'Processor')), # 3.0 GHz etc.
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
('Screen Size', (SELECT id FROM categories WHERE name = 'Laptop'));

-- // SUBCATEGORIES - Peripherals /////////////////////////////////////////////////////////

-- Monitor specific attributes
INSERT INTO attributes (name, category_id) VALUES
('Screen Size', (SELECT id FROM categories WHERE name = 'Monitor')),			# inches
('Panel Type', (SELECT id FROM categories WHERE name = 'Monitor')),				# (IPS/TN/VA)
('Resolution', (SELECT id FROM categories WHERE name = 'Monitor')),				# çözünürlük, 2K, 4K etc.
('Refresh Rate', (SELECT id FROM categories WHERE name = 'Monitor')),			# Hz
('Response Time', (SELECT id FROM categories WHERE name = 'Monitor'));			# ms

-- Keyboard specific attributes
INSERT INTO attributes (name, category_id) VALUES
('Key Layout', (SELECT id FROM categories WHERE name = 'Keyboard')),			# qTürkçe, fTürkçe, qİngilizce...
('Keyboard Type', (SELECT id FROM categories WHERE name = 'Keyboard'));			# mechanical, membrane

-- Mouse specific attributes
INSERT INTO attributes (name, category_id) VALUES
('Button Count', (SELECT id FROM categories WHERE name = 'Mouse')),
('Max DPI', (SELECT id FROM categories WHERE name = 'Mouse'));
