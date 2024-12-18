# import re
# import random
# from datetime import datetime, timedelta

# def extract_product_names(sql_text):
#     pattern = r"'([^']+)',\s*'[^']+',\s*\d+\.?\d*,\s*\"[^\"]+\""
#     return re.findall(pattern, sql_text)

# def extract_usernames(sql_text):
#     pattern1 = r"\((\d+),\s*'([^']+)',\s*'[^']+',\s*'[^']+'"
#     pattern2 = r"\('([^']+)',\s*'[^']+',\s*'[^']+'"
    
#     usernames = []
    
#     matches1 = re.finditer(pattern1, sql_text)
#     matches2 = re.finditer(pattern2, sql_text)
    
#     for match in matches1:
#         usernames.append((int(match.group(1)), match.group(2)))
    
#     for match in matches2:
#         usernames.append((len(usernames) + 1, match.group(1)))
    
#     return usernames

# def generate_orders_sql(usernames, products):
#     order_sql = ["INSERT INTO orders (id, order_date, status, total_price, user_id) VALUES"]
#     order_items_sql = ["INSERT INTO order_items (id, quantity, order_id, product_id) VALUES"]
#     order_id = 1
#     order_item_id = 1
    
#     statuses = ['CREATED', 'SHIPPED', 'DELIVERED']
    
#     for user_id, username in usernames:
#         num_orders = random.randint(0, 3)
        
#         for _ in range(num_orders):
#             days_ago = random.randint(0, 30)
#             order_date = (datetime.now() - timedelta(days=days_ago)).strftime('%Y-%m-%d')
#             status = random.choice(statuses)
            
#             # Generate order items first to calculate total price
#             num_items = random.randint(1, 3)
#             selected_products = random.sample(products, num_items)
#             total_price = 0
            
#             order_sql.append(
#                 f"({order_id}, '{order_date}', '{status}', {total_price}, {user_id})"
#             )
            
#             for product_name in selected_products:
#                 quantity = random.randint(1, 3)
#                 order_items_sql.append(
#                     f"({order_item_id}, {quantity}, {order_id}, "
#                     f"(SELECT id FROM products WHERE name = '{product_name}'))"
#                 )
#                 order_item_id += 1
            
#             order_id += 1

#     return (",\n".join(order_sql) + ";", ",\n".join(order_items_sql) + ";")

# # Example usage
# products = extract_product_names(
# """
# INSERT INTO products (name, description, price, brand, model, category_id) VALUES
# ('AMD Ryzen 7 5800X', '8-core processor for gaming and productivity', 299.99, "AMD", "Ryzen 7 5800X", (SELECT id FROM categories WHERE name = 'Processor')),
# ('Intel Core i9-12900K', 'High-end desktop processor', 589.99, "Intel", "Core i9-12900K", (SELECT id FROM categories WHERE name = 'Processor'));
# INSERT INTO products (name, description, price, brand, model, category_id) VALUES
# ('ASUS ROG Maximus Z790 Hero', 'High-end motherboard for Intel 13th Gen CPUs', 600.00, "ASUS", "ROG Maximus Z790 Hero", (SELECT id FROM categories WHERE name = 'Motherboard')),
# ('MSI MPG Z790 Carbon WiFi', 'Feature-rich motherboard with WiFi 6E', 400.00, "MSI", "MPG Z790 Carbon WiFi", (SELECT id FROM categories WHERE name = 'Motherboard'));
# INSERT INTO products (name, description, price, brand, model, category_id) VALUES
# ('Corsair Vengeance LPX 16GB (2x8GB) DDR4 3200MHz', '16GB DDR4 RAM for gaming and general use', 79.99, "Corsair", "CMK16GX4M2B3200C16", (SELECT id FROM categories WHERE name = 'RAM')),
# ('G.Skill Trident Z Neo 32GB (2x16GB) DDR4 3600MHz', 'High-performance 32GB DDR4 RAM', 149.99, "G.Skill", "F4-3600C16D-32GTZN", (SELECT id FROM categories WHERE name = 'RAM'));
# INSERT INTO products (name, description, price, brand, model, category_id) VALUES
# ('NVIDIA GeForce RTX 4080', 'High-end graphics card for 4K gaming', 1199.99, "NVIDIA", "RTX 4080", (SELECT id FROM categories WHERE name = 'Graphic Card')),
# ('AMD Radeon RX 7900 XTX', 'Powerful graphics card for 4K gaming', 999.99, "AMD", "RX 7900 XTX", (SELECT id FROM categories WHERE name = 'Graphic Card'));
# INSERT INTO products (name, description, price, brand, model, category_id) VALUES
# ('Corsair 4000D Airflow', 'Mid-tower ATX case with excellent airflow', 99.99, "Corsair", "4000D Airflow", (SELECT id FROM categories WHERE name = 'Computer Case')),
# ('Fractal Design Meshify 2', 'High-airflow ATX case with a minimalist design', 129.99, "Fractal Design", "Meshify 2", (SELECT id FROM categories WHERE name = 'Computer Case'));
# INSERT INTO products (name, description, price, brand, model, category_id) VALUES
# ('Corsair RM850x (2021)', '850W 80+ Gold fully modular power supply', 159.99, "Corsair", "RM850x (2021)", (SELECT id FROM categories WHERE name = 'Power Supply')),
# ('Seasonic FOCUS GX-750', '750W 80+ Gold fully modular power supply', 129.99, "Seasonic", "FOCUS GX-750", (SELECT id FROM categories WHERE name = 'Power Supply'));
# INSERT INTO products (name, description, price, brand, model, category_id) VALUES
# ('SkyTech Blaze 3.0 Gaming PC', 'Gaming desktop with RTX 3060', 1299.99, "SkyTech", "Blaze 3.0", (SELECT id FROM categories WHERE name = 'Desktop')),
# ('HP Omen 45L Gaming Desktop', 'High-end gaming PC with liquid cooling', 2499.99, "HP", "Omen 45L", (SELECT id FROM categories WHERE name = 'Desktop'));
# INSERT INTO products (name, description, price, brand, model, category_id) VALUES
# ('MacBook Pro 16-inch', 'Powerful laptop with M2 Pro chip', 2499.99, "Apple", "MacBook Pro 16", (SELECT id FROM categories WHERE name = 'Laptop')),
# ('ASUS ROG Zephyrus G14', 'Gaming laptop with AMD Ryzen 9', 1799.99, "ASUS", "ROG Zephyrus G14", (SELECT id FROM categories WHERE name = 'Laptop'));
# INSERT INTO products (name, description, price, brand, model, category_id) VALUES
# ('LG 27GL850-B 27" QHD IPS 144Hz Gaming Monitor', '27-inch QHD gaming monitor', 399.99, "LG", "27GL850-B", (SELECT id FROM categories WHERE name = 'Monitor')),
# ('Samsung Odyssey G9 49" DQHD 240Hz', '49-inch ultrawide gaming monitor', 1499.99, "Samsung", "Odyssey G9", (SELECT id FROM categories WHERE name = 'Monitor'));
# INSERT INTO products (name, description, price, brand, model, category_id) VALUES
# ('Corsair K70 RGB MK.2 Mechanical Keyboard', 'Mechanical gaming keyboard with Cherry MX Brown switches', 129.99, "Corsair", "K70 RGB MK.2", (SELECT id FROM categories WHERE name = 'Keyboard')),
# ('Logitech G915 TKL Wireless Gaming Keyboard', 'Wireless keyboard with low-profile GL switches', 229.99, "Logitech", "G915 TKL", (SELECT id FROM categories WHERE name = 'Keyboard'));
# INSERT INTO products (name, description, price, brand, model, category_id) VALUES
# ('Logitech G502 HERO High Performance Gaming Mouse', 'Wired gaming mouse with adjustable weights', 79.99, "Logitech", "G502 HERO", (SELECT id FROM categories WHERE name = 'Mouse')),
# ('Razer DeathAdder V2 Pro Wireless Gaming Mouse', 'Wireless gaming mouse with ergonomic design', 129.99, "Razer", "DeathAdder V2 Pro", (SELECT id FROM categories WHERE name = 'Mouse')); 
# """)
# usernames = extract_usernames("""
# INSERT INTO users (id, username, password, first_name, middle_initial, last_name, birth_date, is_admin, email, phone_number, gender, job ,address) VALUES
# (1, 'johndoe', 'password123', 'John', 'A', 'Doe', '1990-05-14', false, 'johndoe@example.com', '1234567890', 'M', 'accountant', 'İzmir'),
# (2, 'janedoe', 'password123', 'Jane', null, 'Doe', '1992-03-22', false, 'janedoe@example.com', '0987654321', 'F', 'teacher', 'Bursa'),
# (3, 'bobjones', 'password123', 'Bob', 'C', 'Jones', '1989-08-09', false, 'bobjones@example.com', '1239874560', 'M', 'engineer', 'Ankara'),
# (4, 'alicebrown', 'password123', 'Alice', null, 'Brown', '1998-12-01', false, 'alicebrown@example.com', 'F', 'accountant', '5678901234', 'İstanbul'),
# (5, 'mikelee', 'password123', 'Mike', 'D', 'Lee', '1970-07-15', false, 'mikelee@example.com', '3456789012', 'M', 'doctor', 'İstanbul'),
# (6, 'emilywhite', 'password123', 'Emily', 'E', 'White', '2005-11-20', false, 'emilywhite@example.com', '7890123456', 'F', 'engineer', 'Trabzon'),
# (7, 'davidblack', 'password123', 'David', null, 'Black', '1965-02-18', false, 'davidblack@example.com', '2345678901', 'M', 'waiter', 'Adana'),
# (8, 'g4stly', 'adminpassword', 'G4stly', null, 'the Lord', '2003-01-01', true, 'g4stly@example.com', null, 'M', 'CEO', 'İstanbul');
# INSERT INTO users (username, password, first_name, middle_initial, last_name, birth_date, is_admin, email, phone_number, gender, job, address) VALUES
# ('Mustafa_Yilmaz', 'password123', 'Mustafa', 'A', 'Yılmaz', '2000-11-18', 0, 'user9@example.com', '5325140143', 'M', 'engineer', 'İstanbul'),
# ('Ahmet_Kaya', 'password123', 'Ahmet', 'B', 'Kaya', '2000-02-28', 0, 'user10@example.com', '5029714955', 'M', 'doctor', 'Ankara'),
# ('Ali_Demir', 'password123', 'Ali', 'C', 'Demir', '1966-01-08', 0, 'user11@example.com', '5173401770', 'M', 'accountant', 'İzmir'),
# ('Huseyin_Sahin', 'password123', 'Hüseyin', 'D', 'Şahin', '1991-02-14', 0, 'user12@example.com', '5814970205', 'M', 'waiter', 'Bursa'),
# ('Hasan_Celik', 'password123', 'Hasan', 'E', 'Çelik', '1991-01-29', 0, 'user13@example.com', '5799835956', 'M', 'nurse', 'Adana'),
# ('Ismail_Ozturk', 'password123', 'İsmail', 'F', 'Öztürk', '1964-02-03', 0, 'user14@example.com', '5084440481', 'M', 'architect', 'Trabzon'),
# ('Mehmet_Aydin', 'password123', 'Mehmet', 'G', 'Aydın', '1982-06-11', 0, 'user15@example.com', '5284714821', 'M', 'designer', 'Giresun'),
# ('Osman_Arslan', 'password123', 'Osman', 'H', 'Arslan', '1965-08-22', 0, 'user16@example.com', '5811030851', 'M', 'police officer', 'Samsun'),
# ('Yusuf_Dogan', 'password123', 'Yusuf', 'I', 'Doğan', '2001-09-02', 0, 'user17@example.com', '5725063329', 'M', 'lawyer', 'İstanbul'),
# ('Murat_Kilic', 'password123', 'Murat', 'J', 'Kılıç', '2000-05-23', 0, 'user18@example.com', '5843957514', 'M', 'dentist', 'Ankara'),
# ('Omer_Yilmaz', 'password123', 'Ömer', 'K', 'Yılmaz', '1988-02-06', 0, 'user19@example.com', '5189566756', 'M', 'vet', 'İzmir'),
# ('Ramazan_Kaya', 'password123', 'Ramazan', 'L', 'Kaya', '1984-04-04', 0, 'user20@example.com', '5186266245', 'M', 'engineer', 'Bursa'),
# ('Suleyman_Demir', 'password123', 'Süleyman', 'M', 'Demir', '1964-05-14', 0, 'user21@example.com', '5349401039', 'M', 'doctor', 'Adana'),
# ('Abdullah_Sahin', 'password123', 'Abdullah', 'N', 'Şahin', '1975-12-16', 0, 'user22@example.com', '5601343758', 'M', 'accountant', 'Trabzon'),
# ('Mahmut_Celik', 'password123', 'Mahmut', 'O', 'Çelik', '1998-10-26', 0, 'user23@example.com', '5809650297', 'M', 'waiter', 'Giresun'),
# ('Recep_Ozturk', 'password123', 'Recep', 'P', 'Öztürk', '1989-02-07', 0, 'user24@example.com', '5329730645', 'M', 'nurse', 'Samsun'),
# ('Salih_Aydin', 'password123', 'Salih', 'Q', 'Aydın', '1990-11-21', 0, 'user25@example.com', '5819676829', 'M', 'architect', 'İstanbul'),
# ('Fatih_Arslan', 'password123', 'Fatih', 'R', 'Arslan', '1964-11-02', 0, 'user26@example.com', '5864094161', 'M', 'designer', 'Ankara'),
# ('Kadir_Dogan', 'password123', 'Kadir', 'S', 'Doğan', '1993-09-27', 0, 'user27@example.com', '5326451906', 'M', 'police officer', 'İzmir'),
# ('Emre_Kilic', 'password123', 'Emre', 'T', 'Kılıç', '1968-06-09', 0, 'user28@example.com', '5647427581', 'M', 'lawyer', 'Bursa'),
# ('Hakan_Yilmaz', 'password123', 'Hakan', 'U', 'Yılmaz', '1990-11-01', 0, 'user29@example.com', '5738935974', 'M', 'dentist', 'Adana'),
# ('Adem_Kaya', 'password123', 'Adem', 'V', 'Kaya', '1965-09-23', 0, 'user30@example.com', '5149370787', 'M', 'vet', 'Trabzon'),
# ('Kemal_Demir', 'password123', 'Kemal', 'W', 'Demir', '1970-08-19', 0, 'user31@example.com', '5260106834', 'M', 'engineer', 'Giresun'),
# ('Yasar_Sahin', 'password123', 'Yaşar', 'X', 'Şahin', '1993-03-25', 0, 'user32@example.com', '5991291318', 'M', 'doctor', 'Samsun'),
# ('Bekir_Celik', 'password123', 'Bekir', 'Y', 'Çelik', '1981-09-22', 0, 'user33@example.com', '5053702839', 'M', 'accountant', 'İstanbul'),
# ('Musa_Ozturk', 'password123', 'Musa', 'Z', 'Öztürk', '1975-10-14', 0, 'user34@example.com', '5065512706', 'M', 'waiter', 'Ankara'),
# ('Metin_Aydin', 'password123', 'Metin', 'A', 'Aydın', '1974-07-02', 0, 'user35@example.com', '5144067967', 'M', 'nurse', 'İzmir'),
# ('Bayram_Arslan', 'password123', 'Bayram', 'B', 'Arslan', '1973-10-05', 0, 'user36@example.com', '5442351682', 'M', 'architect', 'Bursa'),
# ('Serkan_Dogan', 'password123', 'Serkan', 'C', 'Doğan', '1997-12-28', 0, 'user37@example.com', '5543642725', 'M', 'designer', 'Adana'),
# ('Orhan_Kilic', 'password123', 'Orhan', 'D', 'Kılıç', '1978-08-10', 0, 'user38@example.com', '5365554825', 'M', 'police officer', 'Trabzon'),
# ('Burak_Yilmaz', 'password123', 'Burak', 'E', 'Yılmaz', '1969-08-17', 0, 'user39@example.com', '5755683248', 'M', 'lawyer', 'Giresun'),
# ('Furkan_Kaya', 'password123', 'Furkan', 'F', 'Kaya', '1974-11-17', 0, 'user40@example.com', '5948092814', 'M', 'dentist', 'Samsun'),
# ('Gokhan_Demir', 'password123', 'Gökhan', 'G', 'Demir', '1999-03-29', 0, 'user41@example.com', '5924949900', 'M', 'vet', 'İstanbul'),
# ('Yasin_Sahin', 'password123', 'Yasin', 'H', 'Şahin', '1968-09-28', 0, 'user42@example.com', '5518560722', 'M', 'engineer', 'Ankara'),
# ('Ugur_Celik', 'password123', 'Uğur', 'I', 'Çelik', '1964-12-20', 0, 'user43@example.com', '5124710596', 'M', 'doctor', 'İzmir'),
# ('Yakup_Ozturk', 'password123', 'Yakup', 'J', 'Öztürk', '1971-09-07', 0, 'user44@example.com', '5832638955', 'M', 'accountant', 'Bursa'),
# ('Muhammed_Aydin', 'password123', 'Muhammed', 'K', 'Aydın', '1988-03-22', 0, 'user45@example.com', '5298180022', 'M', 'waiter', 'Adana'),
# ('Sukru_Arslan', 'password123', 'Şükrü', 'L', 'Arslan', '1983-03-14', 0, 'user46@example.com', '5762821565', 'M', 'nurse', 'Trabzon'),
# ('Cemal_Dogan', 'password123', 'Cemal', 'M', 'Doğan', '1968-06-24', 0, 'user47@example.com', '5052296266', 'M', 'architect', 'Giresun'),
# ('Enes_Kilic', 'password123', 'Enes', 'N', 'Kılıç', '1996-12-02', 0, 'user48@example.com', '5727358445', 'M', 'designer', 'Samsun'),
# ('Yunus_Yilmaz', 'password123', 'Yunus', 'O', 'Yılmaz', '1989-03-08', 0, 'user49@example.com', '5417888361', 'M', 'police officer', 'İstanbul'),
# ('Arif_Kaya', 'password123', 'Arif', 'P', 'Kaya', '1982-04-25', 0, 'user50@example.com', '5741837762', 'M', 'lawyer', 'Ankara'),
# ('Onur_Demir', 'password123', 'Onur', 'Q', 'Demir', '1981-05-27', 0, 'user51@example.com', '5329144725', 'M', 'dentist', 'İzmir'),
# ('Muhammet_Sahin', 'password123', 'Muhammet', 'R', 'Şahin', '1975-09-02', 0, 'user52@example.com', '5684190752', 'M', 'vet', 'Bursa'),
# ('Yilmaz_Celik', 'password123', 'Yılmaz', 'S', 'Çelik', '1990-12-19', 0, 'user53@example.com', '5396901777', 'M', 'engineer', 'Adana'),
# ('Halil_Ozturk', 'password123', 'Halil', 'T', 'Öztürk', '1996-02-01', 0, 'user54@example.com', '5918817953', 'M', 'doctor', 'Trabzon'),
# ('Hanife_Aydin', 'password123', 'Hanife', 'U', 'Aydın', '1982-03-28', 0, 'user55@example.com', '5307420029', 'F', 'accountant', 'Giresun'),
# ('Merve_Arslan', 'password123', 'Merve', 'V', 'Arslan', '1996-07-10', 0, 'user56@example.com', '5708252761', 'F', 'waiter', 'Samsun'),
# ('Zeliha_Dogan', 'password123', 'Zeliha', 'W', 'Doğan', '1974-09-28', 0, 'user57@example.com', '5493834126', 'F', 'nurse', 'İstanbul'),
# ('Esra_Kilic', 'password123', 'Esra', 'X', 'Kılıç', '2002-12-13', 0, 'user58@example.com', '5353377082', 'F', 'architect', 'Ankara'),
# ('Fadime_Yilmaz', 'password123', 'Fadime', 'Y', 'Yılmaz', '1971-02-02', 0, 'user59@example.com', '5229216657', 'F', 'designer', 'İzmir'),
# ('Ozlem_Kaya', 'password123', 'Özlem', 'Z', 'Kaya', '1986-07-21', 0, 'user60@example.com', '5359222724', 'F', 'police officer', 'Bursa'),
# ('Yasemin_Demir', 'password123', 'Yasemin', 'A', 'Demir', '1984-04-10', 0, 'user61@example.com', '5230162621', 'F', 'lawyer', 'Adana'),
# ('Melek_Sahin', 'password123', 'Melek', 'B', 'Şahin', '1990-07-20', 0, 'user62@example.com', '5206671212', 'F', 'dentist', 'Trabzon'),
# ('Rabia_Celik', 'password123', 'Rabia', 'C', 'Çelik', '1996-07-08', 0, 'user63@example.com', '5268010852', 'F', 'vet', 'Giresun'),
# ('Hulya_Ozturk', 'password123', 'Hülya', 'D', 'Öztürk', '1990-07-20', 0, 'user64@example.com', '5438978974', 'F', 'engineer', 'Samsun'),
# ('Cemile_Aydin', 'password123', 'Cemile', 'E', 'Aydın', '1989-09-02', 0, 'user65@example.com', '5387497311', 'F', 'doctor', 'İstanbul'),
# ('Sevim_Arslan', 'password123', 'Sevim', 'F', 'Arslan', '1972-07-09', 0, 'user66@example.com', '5414050386', 'F', 'accountant', 'Ankara'),
# ('Gulsum_Dogan', 'password123', 'Gülsüm', 'G', 'Doğan', '1967-01-23', 0, 'user67@example.com', '5398831051', 'F', 'waiter', 'İzmir'),
# ('Leyla_Kilic', 'password123', 'Leyla', 'H', 'Kılıç', '1989-09-17', 0, 'user68@example.com', '5951125599', 'F', 'nurse', 'Bursa'),
# ('Dilek_Yilmaz', 'password123', 'Dilek', 'I', 'Yılmaz', '1985-04-04', 0, 'user69@example.com', '5565221935', 'F', 'architect', 'Adana'),
# ('Busra_Kaya', 'password123', 'Büşra', 'J', 'Kaya', '1993-06-30', 0, 'user70@example.com', '5469473309', 'F', 'designer', 'Trabzon'),
# ('Aysel_Demir', 'password123', 'Aysel', 'K', 'Demir', '1992-10-06', 0, 'user71@example.com', '5226152329', 'F', 'police officer', 'Giresun'),
# ('Songul_Sahin', 'password123', 'Songül', 'L', 'Şahin', '1980-07-21', 0, 'user72@example.com', '5871960397', 'F', 'lawyer', 'Samsun'),
# ('Kubra_Celik', 'password123', 'Kübra', 'M', 'Çelik', '1978-03-23', 0, 'user73@example.com', '5502732906', 'F', 'dentist', 'İstanbul'),
# ('Esma_Ozturk', 'password123', 'Esma', 'N', 'Öztürk', '1964-03-12', 0, 'user74@example.com', '5665461810', 'F', 'vet', 'Ankara'),
# ('Aynur_Aydin', 'password123', 'Aynur', 'O', 'Aydın', '2001-12-27', 0, 'user75@example.com', '5339591632', 'F', 'engineer', 'İzmir'),
# ('Hayriye_Arslan', 'password123', 'Hayriye', 'P', 'Arslan', '1988-11-02', 0, 'user76@example.com', '5742183122', 'F', 'doctor', 'Bursa'),
# ('Kadriye_Dogan', 'password123', 'Kadriye', 'Q', 'Doğan', '1994-02-21', 0, 'user77@example.com', '5859382795', 'F', 'accountant', 'Adana'),
# ('Tugba_Kilic', 'password123', 'Tuğba', 'R', 'Kılıç', '1991-07-01', 0, 'user78@example.com', '5351312490', 'F', 'waiter', 'Trabzon'),
# ('Sevgi_Yilmaz', 'password123', 'Sevgi', 'S', 'Yılmaz', '1984-11-04', 0, 'user79@example.com', '5737023423', 'F', 'nurse', 'Giresun'),
# ('Rukiye_Kaya', 'password123', 'Rukiye', 'T', 'Kaya', '1965-02-26', 0, 'user80@example.com', '5000767180', 'F', 'architect', 'Samsun'),
# ('Havva_Demir', 'password123', 'Havva', 'U', 'Demir', '1969-04-30', 0, 'user81@example.com', '5398209948', 'F', 'designer', 'İstanbul'),
# ('Sibel_Sahin', 'password123', 'Sibel', 'V', 'Şahin', '2002-07-05', 0, 'user82@example.com', '5535350700', 'F', 'police officer', 'Ankara'),
# ('Derya_Celik', 'password123', 'Derya', 'W', 'Çelik', '1964-01-17', 0, 'user83@example.com', '5676645189', 'F', 'lawyer', 'İzmir'),
# ('Asiye_Ozturk', 'password123', 'Asiye', 'X', 'Öztürk', '2002-10-26', 0, 'user84@example.com', '5970212011', 'F', 'dentist', 'Bursa'),
# ('Filiz_Aydin', 'password123', 'Filiz', 'Y', 'Aydın', '1973-04-05', 0, 'user85@example.com', '5434278218', 'F', 'vet', 'Adana'),
# ('Kezban_Arslan', 'password123', 'Kezban', 'Z', 'Arslan', '1971-12-16', 0, 'user86@example.com', '5247226444', 'F', 'engineer', 'Trabzon'),
# ('Ebru_Dogan', 'password123', 'Ebru', 'A', 'Doğan', '1986-12-03', 0, 'user87@example.com', '5596416260', 'F', 'doctor', 'Giresun'),
# ('Aysegul_Kilic', 'password123', 'Ayşegül', 'B', 'Kılıç', '1990-06-24', 0, 'user88@example.com', '5605299529', 'F', 'accountant', 'Samsun'),
# ('Ece_Yilmaz', 'password123', 'Ece', 'C', 'Yılmaz', '1989-04-23', 0, 'user89@example.com', '5464520342', 'F', 'waiter', 'İstanbul'),
# ('Zeynep_Kaya', 'password123', 'Zeynep', 'D', 'Kaya', '1998-04-01', 0, 'user90@example.com', '5952446077', 'F', 'nurse', 'Ankara'),
# ('Elif_Demir', 'password123', 'Elif', 'E', 'Demir', '1997-06-11', 0, 'user91@example.com', '5069628776', 'F', 'architect', 'İzmir'),
# ('Selma_Sahin', 'password123', 'Selma', 'F', 'Şahin', '1980-06-23', 0, 'user92@example.com', '5263744801', 'F', 'designer', 'Bursa'),
# ('Zehra_Celik', 'password123', 'Zehra', 'G', 'Çelik', '1998-12-14', 0, 'user93@example.com', '5421706050', 'F', 'police officer', 'Adana'),
# ('Sultan_Ozturk', 'password123', 'Sultan', 'H', 'Öztürk', '1964-06-01', 0, 'user94@example.com', '5178627698', 'F', 'lawyer', 'Trabzon'),
# ('Hanife_Aydin2', 'password123', 'Hanife', 'I', 'Aydın', '1997-04-27', 0, 'user95@example.com', '5827286974', 'F', 'dentist', 'Giresun'),
# ('Merve_Arslan2', 'password123', 'Merve', 'J', 'Arslan', '1970-03-27', 0, 'user96@example.com', '5700724518', 'F', 'vet', 'Samsun'),
# ('Zeliha_Dogan2', 'password123', 'Zeliha', 'K', 'Doğan', '1981-01-06', 0, 'user97@example.com', '5111508295', 'F', 'engineer', 'İstanbul'),
# ('Esra_Kilic2', 'password123', 'Esra', 'L', 'Kılıç', '1995-11-29', 0, 'user98@example.com', '5129390702', 'F', 'doctor', 'Ankara'),
# ('Fadime_Yilmaz2', 'password123', 'Fadime', 'M', 'Yılmaz', '1975-12-19', 0, 'user99@example.com', '5540591973', 'F', 'accountant', 'İzmir'),
# ('Ozlem_Kaya2', 'password123', 'Özlem', 'N', 'Kaya', '1964-07-17', 0, 'user100@example.com', '5271535245', 'F', 'waiter', 'Bursa');
# """)

# orders_sql, order_items_sql = generate_orders_sql(usernames, products)

# print("-- Orders SQL:")
# print(orders_sql)
# print("\n-- Order Items SQL:")
# print(order_items_sql)

import re
import random
from datetime import datetime, timedelta

def extract_product_data(sql_text):
    pattern = r"'([^']+)',\s*'[^']+',\s*(\d+\.?\d*),\s*\"[^\"]+\""
    matches = re.findall(pattern, sql_text)
    return [(name, float(price)) for name, price in matches]

def extract_users(sql_text):
    pattern1 = r"\((\d+),\s*'[^']+',\s*'[^']+',\s*'([^']+)'"
    pattern2 = r"\('[^']+',\s*'[^']+',\s*'([^']+)'"
    
    users = []
    matches1 = re.finditer(pattern1, sql_text)
    matches2 = re.finditer(pattern2, sql_text)
    
    for match in matches1:
        users.append((int(match.group(1)), match.group(2)))
    
    return users

def generate_orders_sql(users, products):
    order_sql = ["INSERT INTO orders (id, order_date, status, total_price, user_id) VALUES"]
    order_items_sql = ["INSERT INTO order_items (id, quantity, order_id, product_id) VALUES"]
    
    order_id = 1
    order_item_id = 1
    statuses = ['CREATED', 'SHIPPED', 'DELIVERED']
    
    for user_id, first_name in users:
        num_orders = random.randint(0, 3)
        
        for _ in range(num_orders):
            days_ago = random.randint(0, 30)
            order_date = (datetime.now() - timedelta(days=days_ago)).strftime('%Y-%m-%d')
            status = random.choice(statuses)
            
            order_sql.append(
                f"({order_id}, '{order_date}', '{status}', 0.0, "
                f"(SELECT id FROM users WHERE first_name = '{first_name}'))"
            )
            
            num_items = random.randint(1, 3)
            selected_products = random.sample(products, num_items)
            
            for product_name, _ in selected_products:
                quantity = random.randint(1, 3)
                order_items_sql.append(
                    f"({order_item_id}, {quantity}, {order_id}, "
                    f"(SELECT id FROM products WHERE name = '{product_name}'))"
                )
                order_item_id += 1
            
            order_id += 1

    return (",\n".join(order_sql) + ";", ",\n".join(order_items_sql) + ";")

# data
products = extract_product_data(
"""
INSERT INTO products (name, description, price, brand, model, category_id) VALUES
('AMD Ryzen 7 5800X', '8-core processor for gaming and productivity', 299.99, "AMD", "Ryzen 7 5800X", (SELECT id FROM categories WHERE name = 'Processor')),
('Intel Core i9-12900K', 'High-end desktop processor', 589.99, "Intel", "Core i9-12900K", (SELECT id FROM categories WHERE name = 'Processor'));
INSERT INTO products (name, description, price, brand, model, category_id) VALUES
('ASUS ROG Maximus Z790 Hero', 'High-end motherboard for Intel 13th Gen CPUs', 600.00, "ASUS", "ROG Maximus Z790 Hero", (SELECT id FROM categories WHERE name = 'Motherboard')),
('MSI MPG Z790 Carbon WiFi', 'Feature-rich motherboard with WiFi 6E', 400.00, "MSI", "MPG Z790 Carbon WiFi", (SELECT id FROM categories WHERE name = 'Motherboard'));
INSERT INTO products (name, description, price, brand, model, category_id) VALUES
('Corsair Vengeance LPX 16GB (2x8GB) DDR4 3200MHz', '16GB DDR4 RAM for gaming and general use', 79.99, "Corsair", "CMK16GX4M2B3200C16", (SELECT id FROM categories WHERE name = 'RAM')),
('G.Skill Trident Z Neo 32GB (2x16GB) DDR4 3600MHz', 'High-performance 32GB DDR4 RAM', 149.99, "G.Skill", "F4-3600C16D-32GTZN", (SELECT id FROM categories WHERE name = 'RAM'));
INSERT INTO products (name, description, price, brand, model, category_id) VALUES
('NVIDIA GeForce RTX 4080', 'High-end graphics card for 4K gaming', 1199.99, "NVIDIA", "RTX 4080", (SELECT id FROM categories WHERE name = 'Graphic Card')),
('AMD Radeon RX 7900 XTX', 'Powerful graphics card for 4K gaming', 999.99, "AMD", "RX 7900 XTX", (SELECT id FROM categories WHERE name = 'Graphic Card'));
INSERT INTO products (name, description, price, brand, model, category_id) VALUES
('Corsair 4000D Airflow', 'Mid-tower ATX case with excellent airflow', 99.99, "Corsair", "4000D Airflow", (SELECT id FROM categories WHERE name = 'Computer Case')),
('Fractal Design Meshify 2', 'High-airflow ATX case with a minimalist design', 129.99, "Fractal Design", "Meshify 2", (SELECT id FROM categories WHERE name = 'Computer Case'));
INSERT INTO products (name, description, price, brand, model, category_id) VALUES
('Corsair RM850x (2021)', '850W 80+ Gold fully modular power supply', 159.99, "Corsair", "RM850x (2021)", (SELECT id FROM categories WHERE name = 'Power Supply')),
('Seasonic FOCUS GX-750', '750W 80+ Gold fully modular power supply', 129.99, "Seasonic", "FOCUS GX-750", (SELECT id FROM categories WHERE name = 'Power Supply'));
INSERT INTO products (name, description, price, brand, model, category_id) VALUES
('SkyTech Blaze 3.0 Gaming PC', 'Gaming desktop with RTX 3060', 1299.99, "SkyTech", "Blaze 3.0", (SELECT id FROM categories WHERE name = 'Desktop')),
('HP Omen 45L Gaming Desktop', 'High-end gaming PC with liquid cooling', 2499.99, "HP", "Omen 45L", (SELECT id FROM categories WHERE name = 'Desktop'));
INSERT INTO products (name, description, price, brand, model, category_id) VALUES
('MacBook Pro 16-inch', 'Powerful laptop with M2 Pro chip', 2499.99, "Apple", "MacBook Pro 16", (SELECT id FROM categories WHERE name = 'Laptop')),
('ASUS ROG Zephyrus G14', 'Gaming laptop with AMD Ryzen 9', 1799.99, "ASUS", "ROG Zephyrus G14", (SELECT id FROM categories WHERE name = 'Laptop'));
INSERT INTO products (name, description, price, brand, model, category_id) VALUES
('LG 27GL850-B 27" QHD IPS 144Hz Gaming Monitor', '27-inch QHD gaming monitor', 399.99, "LG", "27GL850-B", (SELECT id FROM categories WHERE name = 'Monitor')),
('Samsung Odyssey G9 49" DQHD 240Hz', '49-inch ultrawide gaming monitor', 1499.99, "Samsung", "Odyssey G9", (SELECT id FROM categories WHERE name = 'Monitor'));
INSERT INTO products (name, description, price, brand, model, category_id) VALUES
('Corsair K70 RGB MK.2 Mechanical Keyboard', 'Mechanical gaming keyboard with Cherry MX Brown switches', 129.99, "Corsair", "K70 RGB MK.2", (SELECT id FROM categories WHERE name = 'Keyboard')),
('Logitech G915 TKL Wireless Gaming Keyboard', 'Wireless keyboard with low-profile GL switches', 229.99, "Logitech", "G915 TKL", (SELECT id FROM categories WHERE name = 'Keyboard'));
INSERT INTO products (name, description, price, brand, model, category_id) VALUES
('Logitech G502 HERO High Performance Gaming Mouse', 'Wired gaming mouse with adjustable weights', 79.99, "Logitech", "G502 HERO", (SELECT id FROM categories WHERE name = 'Mouse')),
('Razer DeathAdder V2 Pro Wireless Gaming Mouse', 'Wireless gaming mouse with ergonomic design', 129.99, "Razer", "DeathAdder V2 Pro", (SELECT id FROM categories WHERE name = 'Mouse')); 
""")

users  = extract_users("""
INSERT INTO users (id, username, password, first_name, middle_initial, last_name, birth_date, is_admin, email, phone_number, gender, job ,address) VALUES
(1, 'johndoe', 'password123', 'John', 'A', 'Doe', '1990-05-14', false, 'johndoe@example.com', '1234567890', 'M', 'accountant', 'İzmir'),
(2, 'janedoe', 'password123', 'Jane', null, 'Doe', '1992-03-22', false, 'janedoe@example.com', '0987654321', 'F', 'teacher', 'Bursa'),
(3, 'bobjones', 'password123', 'Bob', 'C', 'Jones', '1989-08-09', false, 'bobjones@example.com', '1239874560', 'M', 'engineer', 'Ankara'),
(4, 'alicebrown', 'password123', 'Alice', null, 'Brown', '1998-12-01', false, 'alicebrown@example.com', 'F', 'accountant', '5678901234', 'İstanbul'),
(5, 'mikelee', 'password123', 'Mike', 'D', 'Lee', '1970-07-15', false, 'mikelee@example.com', '3456789012', 'M', 'doctor', 'İstanbul'),
(6, 'emilywhite', 'password123', 'Emily', 'E', 'White', '2005-11-20', false, 'emilywhite@example.com', '7890123456', 'F', 'engineer', 'Trabzon'),
(7, 'davidblack', 'password123', 'David', null, 'Black', '1965-02-18', false, 'davidblack@example.com', '2345678901', 'M', 'waiter', 'Adana'),
(8, 'g4stly', 'adminpassword', 'G4stly', null, 'the Lord', '2003-01-01', true, 'g4stly@example.com', null, 'M', 'CEO', 'İstanbul');
INSERT INTO users (username, password, first_name, middle_initial, last_name, birth_date, is_admin, email, phone_number, gender, job, address) VALUES
('Mustafa_Yilmaz', 'password123', 'Mustafa', 'A', 'Yılmaz', '2000-11-18', 0, 'user9@example.com', '5325140143', 'M', 'engineer', 'İstanbul'),
('Ahmet_Kaya', 'password123', 'Ahmet', 'B', 'Kaya', '2000-02-28', 0, 'user10@example.com', '5029714955', 'M', 'doctor', 'Ankara'),
('Ali_Demir', 'password123', 'Ali', 'C', 'Demir', '1966-01-08', 0, 'user11@example.com', '5173401770', 'M', 'accountant', 'İzmir'),
('Huseyin_Sahin', 'password123', 'Hüseyin', 'D', 'Şahin', '1991-02-14', 0, 'user12@example.com', '5814970205', 'M', 'waiter', 'Bursa'),
('Hasan_Celik', 'password123', 'Hasan', 'E', 'Çelik', '1991-01-29', 0, 'user13@example.com', '5799835956', 'M', 'nurse', 'Adana'),
('Ismail_Ozturk', 'password123', 'İsmail', 'F', 'Öztürk', '1964-02-03', 0, 'user14@example.com', '5084440481', 'M', 'architect', 'Trabzon'),
('Mehmet_Aydin', 'password123', 'Mehmet', 'G', 'Aydın', '1982-06-11', 0, 'user15@example.com', '5284714821', 'M', 'designer', 'Giresun'),
('Osman_Arslan', 'password123', 'Osman', 'H', 'Arslan', '1965-08-22', 0, 'user16@example.com', '5811030851', 'M', 'police officer', 'Samsun'),
('Yusuf_Dogan', 'password123', 'Yusuf', 'I', 'Doğan', '2001-09-02', 0, 'user17@example.com', '5725063329', 'M', 'lawyer', 'İstanbul'),
('Murat_Kilic', 'password123', 'Murat', 'J', 'Kılıç', '2000-05-23', 0, 'user18@example.com', '5843957514', 'M', 'dentist', 'Ankara'),
('Omer_Yilmaz', 'password123', 'Ömer', 'K', 'Yılmaz', '1988-02-06', 0, 'user19@example.com', '5189566756', 'M', 'vet', 'İzmir'),
('Ramazan_Kaya', 'password123', 'Ramazan', 'L', 'Kaya', '1984-04-04', 0, 'user20@example.com', '5186266245', 'M', 'engineer', 'Bursa'),
('Suleyman_Demir', 'password123', 'Süleyman', 'M', 'Demir', '1964-05-14', 0, 'user21@example.com', '5349401039', 'M', 'doctor', 'Adana'),
('Abdullah_Sahin', 'password123', 'Abdullah', 'N', 'Şahin', '1975-12-16', 0, 'user22@example.com', '5601343758', 'M', 'accountant', 'Trabzon'),
('Mahmut_Celik', 'password123', 'Mahmut', 'O', 'Çelik', '1998-10-26', 0, 'user23@example.com', '5809650297', 'M', 'waiter', 'Giresun'),
('Recep_Ozturk', 'password123', 'Recep', 'P', 'Öztürk', '1989-02-07', 0, 'user24@example.com', '5329730645', 'M', 'nurse', 'Samsun'),
('Salih_Aydin', 'password123', 'Salih', 'Q', 'Aydın', '1990-11-21', 0, 'user25@example.com', '5819676829', 'M', 'architect', 'İstanbul'),
('Fatih_Arslan', 'password123', 'Fatih', 'R', 'Arslan', '1964-11-02', 0, 'user26@example.com', '5864094161', 'M', 'designer', 'Ankara'),
('Kadir_Dogan', 'password123', 'Kadir', 'S', 'Doğan', '1993-09-27', 0, 'user27@example.com', '5326451906', 'M', 'police officer', 'İzmir'),
('Emre_Kilic', 'password123', 'Emre', 'T', 'Kılıç', '1968-06-09', 0, 'user28@example.com', '5647427581', 'M', 'lawyer', 'Bursa'),
('Hakan_Yilmaz', 'password123', 'Hakan', 'U', 'Yılmaz', '1990-11-01', 0, 'user29@example.com', '5738935974', 'M', 'dentist', 'Adana'),
('Adem_Kaya', 'password123', 'Adem', 'V', 'Kaya', '1965-09-23', 0, 'user30@example.com', '5149370787', 'M', 'vet', 'Trabzon'),
('Kemal_Demir', 'password123', 'Kemal', 'W', 'Demir', '1970-08-19', 0, 'user31@example.com', '5260106834', 'M', 'engineer', 'Giresun'),
('Yasar_Sahin', 'password123', 'Yaşar', 'X', 'Şahin', '1993-03-25', 0, 'user32@example.com', '5991291318', 'M', 'doctor', 'Samsun'),
('Bekir_Celik', 'password123', 'Bekir', 'Y', 'Çelik', '1981-09-22', 0, 'user33@example.com', '5053702839', 'M', 'accountant', 'İstanbul'),
('Musa_Ozturk', 'password123', 'Musa', 'Z', 'Öztürk', '1975-10-14', 0, 'user34@example.com', '5065512706', 'M', 'waiter', 'Ankara'),
('Metin_Aydin', 'password123', 'Metin', 'A', 'Aydın', '1974-07-02', 0, 'user35@example.com', '5144067967', 'M', 'nurse', 'İzmir'),
('Bayram_Arslan', 'password123', 'Bayram', 'B', 'Arslan', '1973-10-05', 0, 'user36@example.com', '5442351682', 'M', 'architect', 'Bursa'),
('Serkan_Dogan', 'password123', 'Serkan', 'C', 'Doğan', '1997-12-28', 0, 'user37@example.com', '5543642725', 'M', 'designer', 'Adana'),
('Orhan_Kilic', 'password123', 'Orhan', 'D', 'Kılıç', '1978-08-10', 0, 'user38@example.com', '5365554825', 'M', 'police officer', 'Trabzon'),
('Burak_Yilmaz', 'password123', 'Burak', 'E', 'Yılmaz', '1969-08-17', 0, 'user39@example.com', '5755683248', 'M', 'lawyer', 'Giresun'),
('Furkan_Kaya', 'password123', 'Furkan', 'F', 'Kaya', '1974-11-17', 0, 'user40@example.com', '5948092814', 'M', 'dentist', 'Samsun'),
('Gokhan_Demir', 'password123', 'Gökhan', 'G', 'Demir', '1999-03-29', 0, 'user41@example.com', '5924949900', 'M', 'vet', 'İstanbul'),
('Yasin_Sahin', 'password123', 'Yasin', 'H', 'Şahin', '1968-09-28', 0, 'user42@example.com', '5518560722', 'M', 'engineer', 'Ankara'),
('Ugur_Celik', 'password123', 'Uğur', 'I', 'Çelik', '1964-12-20', 0, 'user43@example.com', '5124710596', 'M', 'doctor', 'İzmir'),
('Yakup_Ozturk', 'password123', 'Yakup', 'J', 'Öztürk', '1971-09-07', 0, 'user44@example.com', '5832638955', 'M', 'accountant', 'Bursa'),
('Muhammed_Aydin', 'password123', 'Muhammed', 'K', 'Aydın', '1988-03-22', 0, 'user45@example.com', '5298180022', 'M', 'waiter', 'Adana'),
('Sukru_Arslan', 'password123', 'Şükrü', 'L', 'Arslan', '1983-03-14', 0, 'user46@example.com', '5762821565', 'M', 'nurse', 'Trabzon'),
('Cemal_Dogan', 'password123', 'Cemal', 'M', 'Doğan', '1968-06-24', 0, 'user47@example.com', '5052296266', 'M', 'architect', 'Giresun'),
('Enes_Kilic', 'password123', 'Enes', 'N', 'Kılıç', '1996-12-02', 0, 'user48@example.com', '5727358445', 'M', 'designer', 'Samsun'),
('Yunus_Yilmaz', 'password123', 'Yunus', 'O', 'Yılmaz', '1989-03-08', 0, 'user49@example.com', '5417888361', 'M', 'police officer', 'İstanbul'),
('Arif_Kaya', 'password123', 'Arif', 'P', 'Kaya', '1982-04-25', 0, 'user50@example.com', '5741837762', 'M', 'lawyer', 'Ankara'),
('Onur_Demir', 'password123', 'Onur', 'Q', 'Demir', '1981-05-27', 0, 'user51@example.com', '5329144725', 'M', 'dentist', 'İzmir'),
('Muhammet_Sahin', 'password123', 'Muhammet', 'R', 'Şahin', '1975-09-02', 0, 'user52@example.com', '5684190752', 'M', 'vet', 'Bursa'),
('Yilmaz_Celik', 'password123', 'Yılmaz', 'S', 'Çelik', '1990-12-19', 0, 'user53@example.com', '5396901777', 'M', 'engineer', 'Adana'),
('Halil_Ozturk', 'password123', 'Halil', 'T', 'Öztürk', '1996-02-01', 0, 'user54@example.com', '5918817953', 'M', 'doctor', 'Trabzon'),
('Hanife_Aydin', 'password123', 'Hanife', 'U', 'Aydın', '1982-03-28', 0, 'user55@example.com', '5307420029', 'F', 'accountant', 'Giresun'),
('Merve_Arslan', 'password123', 'Merve', 'V', 'Arslan', '1996-07-10', 0, 'user56@example.com', '5708252761', 'F', 'waiter', 'Samsun'),
('Zeliha_Dogan', 'password123', 'Zeliha', 'W', 'Doğan', '1974-09-28', 0, 'user57@example.com', '5493834126', 'F', 'nurse', 'İstanbul'),
('Esra_Kilic', 'password123', 'Esra', 'X', 'Kılıç', '2002-12-13', 0, 'user58@example.com', '5353377082', 'F', 'architect', 'Ankara'),
('Fadime_Yilmaz', 'password123', 'Fadime', 'Y', 'Yılmaz', '1971-02-02', 0, 'user59@example.com', '5229216657', 'F', 'designer', 'İzmir'),
('Ozlem_Kaya', 'password123', 'Özlem', 'Z', 'Kaya', '1986-07-21', 0, 'user60@example.com', '5359222724', 'F', 'police officer', 'Bursa'),
('Yasemin_Demir', 'password123', 'Yasemin', 'A', 'Demir', '1984-04-10', 0, 'user61@example.com', '5230162621', 'F', 'lawyer', 'Adana'),
('Melek_Sahin', 'password123', 'Melek', 'B', 'Şahin', '1990-07-20', 0, 'user62@example.com', '5206671212', 'F', 'dentist', 'Trabzon'),
('Rabia_Celik', 'password123', 'Rabia', 'C', 'Çelik', '1996-07-08', 0, 'user63@example.com', '5268010852', 'F', 'vet', 'Giresun'),
('Hulya_Ozturk', 'password123', 'Hülya', 'D', 'Öztürk', '1990-07-20', 0, 'user64@example.com', '5438978974', 'F', 'engineer', 'Samsun'),
('Cemile_Aydin', 'password123', 'Cemile', 'E', 'Aydın', '1989-09-02', 0, 'user65@example.com', '5387497311', 'F', 'doctor', 'İstanbul'),
('Sevim_Arslan', 'password123', 'Sevim', 'F', 'Arslan', '1972-07-09', 0, 'user66@example.com', '5414050386', 'F', 'accountant', 'Ankara'),
('Gulsum_Dogan', 'password123', 'Gülsüm', 'G', 'Doğan', '1967-01-23', 0, 'user67@example.com', '5398831051', 'F', 'waiter', 'İzmir'),
('Leyla_Kilic', 'password123', 'Leyla', 'H', 'Kılıç', '1989-09-17', 0, 'user68@example.com', '5951125599', 'F', 'nurse', 'Bursa'),
('Dilek_Yilmaz', 'password123', 'Dilek', 'I', 'Yılmaz', '1985-04-04', 0, 'user69@example.com', '5565221935', 'F', 'architect', 'Adana'),
('Busra_Kaya', 'password123', 'Büşra', 'J', 'Kaya', '1993-06-30', 0, 'user70@example.com', '5469473309', 'F', 'designer', 'Trabzon'),
('Aysel_Demir', 'password123', 'Aysel', 'K', 'Demir', '1992-10-06', 0, 'user71@example.com', '5226152329', 'F', 'police officer', 'Giresun'),
('Songul_Sahin', 'password123', 'Songül', 'L', 'Şahin', '1980-07-21', 0, 'user72@example.com', '5871960397', 'F', 'lawyer', 'Samsun'),
('Kubra_Celik', 'password123', 'Kübra', 'M', 'Çelik', '1978-03-23', 0, 'user73@example.com', '5502732906', 'F', 'dentist', 'İstanbul'),
('Esma_Ozturk', 'password123', 'Esma', 'N', 'Öztürk', '1964-03-12', 0, 'user74@example.com', '5665461810', 'F', 'vet', 'Ankara'),
('Aynur_Aydin', 'password123', 'Aynur', 'O', 'Aydın', '2001-12-27', 0, 'user75@example.com', '5339591632', 'F', 'engineer', 'İzmir'),
('Hayriye_Arslan', 'password123', 'Hayriye', 'P', 'Arslan', '1988-11-02', 0, 'user76@example.com', '5742183122', 'F', 'doctor', 'Bursa'),
('Kadriye_Dogan', 'password123', 'Kadriye', 'Q', 'Doğan', '1994-02-21', 0, 'user77@example.com', '5859382795', 'F', 'accountant', 'Adana'),
('Tugba_Kilic', 'password123', 'Tuğba', 'R', 'Kılıç', '1991-07-01', 0, 'user78@example.com', '5351312490', 'F', 'waiter', 'Trabzon'),
('Sevgi_Yilmaz', 'password123', 'Sevgi', 'S', 'Yılmaz', '1984-11-04', 0, 'user79@example.com', '5737023423', 'F', 'nurse', 'Giresun'),
('Rukiye_Kaya', 'password123', 'Rukiye', 'T', 'Kaya', '1965-02-26', 0, 'user80@example.com', '5000767180', 'F', 'architect', 'Samsun'),
('Havva_Demir', 'password123', 'Havva', 'U', 'Demir', '1969-04-30', 0, 'user81@example.com', '5398209948', 'F', 'designer', 'İstanbul'),
('Sibel_Sahin', 'password123', 'Sibel', 'V', 'Şahin', '2002-07-05', 0, 'user82@example.com', '5535350700', 'F', 'police officer', 'Ankara'),
('Derya_Celik', 'password123', 'Derya', 'W', 'Çelik', '1964-01-17', 0, 'user83@example.com', '5676645189', 'F', 'lawyer', 'İzmir'),
('Asiye_Ozturk', 'password123', 'Asiye', 'X', 'Öztürk', '2002-10-26', 0, 'user84@example.com', '5970212011', 'F', 'dentist', 'Bursa'),
('Filiz_Aydin', 'password123', 'Filiz', 'Y', 'Aydın', '1973-04-05', 0, 'user85@example.com', '5434278218', 'F', 'vet', 'Adana'),
('Kezban_Arslan', 'password123', 'Kezban', 'Z', 'Arslan', '1971-12-16', 0, 'user86@example.com', '5247226444', 'F', 'engineer', 'Trabzon'),
('Ebru_Dogan', 'password123', 'Ebru', 'A', 'Doğan', '1986-12-03', 0, 'user87@example.com', '5596416260', 'F', 'doctor', 'Giresun'),
('Aysegul_Kilic', 'password123', 'Ayşegül', 'B', 'Kılıç', '1990-06-24', 0, 'user88@example.com', '5605299529', 'F', 'accountant', 'Samsun'),
('Ece_Yilmaz', 'password123', 'Ece', 'C', 'Yılmaz', '1989-04-23', 0, 'user89@example.com', '5464520342', 'F', 'waiter', 'İstanbul'),
('Zeynep_Kaya', 'password123', 'Zeynep', 'D', 'Kaya', '1998-04-01', 0, 'user90@example.com', '5952446077', 'F', 'nurse', 'Ankara'),
('Elif_Demir', 'password123', 'Elif', 'E', 'Demir', '1997-06-11', 0, 'user91@example.com', '5069628776', 'F', 'architect', 'İzmir'),
('Selma_Sahin', 'password123', 'Selma', 'F', 'Şahin', '1980-06-23', 0, 'user92@example.com', '5263744801', 'F', 'designer', 'Bursa'),
('Zehra_Celik', 'password123', 'Zehra', 'G', 'Çelik', '1998-12-14', 0, 'user93@example.com', '5421706050', 'F', 'police officer', 'Adana'),
('Sultan_Ozturk', 'password123', 'Sultan', 'H', 'Öztürk', '1964-06-01', 0, 'user94@example.com', '5178627698', 'F', 'lawyer', 'Trabzon'),
('Hanife_Aydin2', 'password123', 'Hanife', 'I', 'Aydın', '1997-04-27', 0, 'user95@example.com', '5827286974', 'F', 'dentist', 'Giresun'),
('Merve_Arslan2', 'password123', 'Merve', 'J', 'Arslan', '1970-03-27', 0, 'user96@example.com', '5700724518', 'F', 'vet', 'Samsun'),
('Zeliha_Dogan2', 'password123', 'Zeliha', 'K', 'Doğan', '1981-01-06', 0, 'user97@example.com', '5111508295', 'F', 'engineer', 'İstanbul'),
('Esra_Kilic2', 'password123', 'Esra', 'L', 'Kılıç', '1995-11-29', 0, 'user98@example.com', '5129390702', 'F', 'doctor', 'Ankara'),
('Fadime_Yilmaz2', 'password123', 'Fadime', 'M', 'Yılmaz', '1975-12-19', 0, 'user99@example.com', '5540591973', 'F', 'accountant', 'İzmir'),
('Ozlem_Kaya2', 'password123', 'Özlem', 'N', 'Kaya', '1964-07-17', 0, 'user100@example.com', '5271535245', 'F', 'waiter', 'Bursa');
""")

orders_sql, order_items_sql = generate_orders_sql(users, products)

print("-- Insert orders:")
print(orders_sql)
print("\n-- Insert order items:")
print(order_items_sql)