use e_commerce_dbms;

# main (parent) categories
SELECT * FROM categories WHERE parent_id IS NULL;

# subcategories for a specific category
SELECT * FROM categories WHERE parent_id = (SELECT id FROM categories where name="Computers");

# all attributes of a category
SELECT name FROM attributes WHERE category_id = (SELECT id FROM categories where name="Computers");

# all attributes and their values for a product
SELECT a.name AS attribute_name, av.value
FROM attribute_values av
JOIN attributes a ON av.attribute_id = a.id
WHERE av.product_id = (SELECT id FROM products where name="Corsair Vengeance LPX 16GB (2x8GB) DDR4 3200MHz");

# products matching specific multiple attribute-value pairs (16GB DDR4 RAMs)
SELECT p.id, p.name
FROM products p
JOIN attribute_values av1 ON p.id = av1.product_id
JOIN attributes a1 ON av1.attribute_id = a1.id
JOIN attribute_values av2 ON p.id = av2.product_id
JOIN attributes a2 ON av2.attribute_id = a2.id
WHERE (a1.name = 'Ram Type' AND av1.value = 'DDR4')
AND (a2.name="Ram Capacity" AND av2.value="16GB");

# all products with their attributes
SELECT p.id, p.name, a.name as attribute_name, av.value  
FROM products p
JOIN attribute_values av ON p.id = av.product_id
JOIN attributes a ON av.attribute_id = a.id;

# products under a specific category (e.g., Processor).
SELECT p.id, p.name
FROM products p
WHERE p.category_id = (SELECT id FROM categories WHERE name="Processor");

# all products with stock and pricing information.
SELECT p.name, p.quantity, p.price
FROM products p;

# average price per category.
SELECT c.name as category_name, AVG(p.price) as avg_price
FROM categories c
JOIN products p ON c.id = p.category_id
GROUP BY c.id, c.name;

# most reviewed products
SELECT p.name as product_name, COUNT(r.id) as review_count
FROM products p
LEFT JOIN reviews r ON p.id = r.product_id
GROUP BY p.id, p.name
ORDER BY review_count DESC;

# products with avg review rating
SELECT p.name, AVG(r.rating) as avg_rating, COUNT(r.id) as review_count
FROM products p
LEFT JOIN reviews r ON p.id = r.product_id
GROUP BY p.id, p.name
ORDER BY avg_rating DESC;

# products with low stock
SELECT name, quantity
FROM products
WHERE quantity < 5; 

# total value of inventory
SELECT SUM(price * quantity) AS total_inventory_value
FROM products;
