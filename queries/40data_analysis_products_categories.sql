use e_commerce_dbms;

# ana kategoriler
SELECT * FROM categories WHERE parent_id IS NULL;

# bir kategorinin tüm alt-kategorileri
SELECT * FROM categories WHERE parent_id = (SELECT id FROM categories where name="Computers");

# bir kategorinin tüm özellikleri
SELECT name FROM attributes WHERE category_id = (SELECT id FROM categories where name="Computers");

# girilen ürünün tüm özellikleri
SELECT a.name AS attribute_name, av.value
FROM attribute_values av
JOIN attributes a ON av.attribute_id = a.id
WHERE av.product_id = (SELECT id FROM products where name="Corsair Vengeance LPX 16GB (2x8GB) DDR4 3200MHz");

# ürünleri özelliklerine göre filtreleme (16GB DDR4 RAMs)
SELECT p.id, p.name
FROM products p
JOIN attribute_values av1 ON p.id = av1.product_id
JOIN attributes a1 ON av1.attribute_id = a1.id
JOIN attribute_values av2 ON p.id = av2.product_id
JOIN attributes a2 ON av2.attribute_id = a2.id
WHERE (a1.name = 'Ram Type' AND av1.value = 'DDR4')
AND (a2.name="Ram Capacity" AND av2.value="16GB");

# tüm ürünler ve özellikleri
SELECT p.id as "product id", p.name, a.name as attribute_name, av.value  
FROM products p
JOIN attribute_values av ON p.id = av.product_id
JOIN attributes a ON av.attribute_id = a.id
ORDER BY p.id;

# bir kategori altındaki tüm ürünler (e.g., Processor).
SELECT p.id, p.name
FROM products p
WHERE p.category_id = (SELECT id FROM categories WHERE name="Processor");

# her kategori için ortalama fiyat
SELECT c.name as category_name, AVG(p.price) as avg_price
FROM categories c
JOIN products p ON c.id = p.category_id
GROUP BY c.id, c.name;

# en çok değerlendirilen ürünler
SELECT p.name as product_name, COUNT(r.id) as review_count
FROM products p
LEFT JOIN reviews r ON p.id = r.product_id
GROUP BY p.id, p.name
ORDER BY review_count DESC;

# ürünler ve ortalama değerlendirme rating'leri
SELECT p.name, AVG(r.rating) as avg_rating, COUNT(r.id) as review_count
FROM products p
LEFT JOIN reviews r ON p.id = r.product_id
GROUP BY p.id, p.name
ORDER BY avg_rating DESC;

# ürünler, fiyat ve stok durumları
SELECT p.name, p.quantity, p.price
FROM products p;

# stokta az bulunan (<3) ürünler
SELECT name, quantity
FROM products
WHERE quantity < 5; 

# envanterin toplam değeri
SELECT SUM(price * quantity) AS total_inventory_value
FROM products;