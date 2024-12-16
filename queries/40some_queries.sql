use e_commerce_dbms;

# main categories
SELECT * FROM categories WHERE parent_id IS NULL;

# subcategories for a specific category
SELECT * FROM categories WHERE parent_id = ?;

# all attributes of a category
SELECT name FROM attributes WHERE category_id = ?;

# all attributes and their values for a product
SELECT a.name AS attribute_name, av.value
FROM attribute_values av
JOIN attributes a ON av.attribute_id = a.id
WHERE av.product_id = ?;

# products matching specific attribute-value pair (rams with MHz = 3200)
SELECT p.id, p.name
FROM products p
JOIN attribute_values av ON p.id = av.product_id
JOIN attributes a ON av.attribute_id = a.id
WHERE a.name = 'MHz' AND av.value = '3200';


#
#Fetch all products with their attributes (JOIN with attribute_values and attributes).
#Retrieve products under a specific category (e.g., Processor).
#Filter products by a specific attribute value (e.g., Socket Type = AM4).
#Display products with stock and pricing information.
#Generate aggregate data, such as the average price per category.








-- DROP SCHEMA e_commerce_dbms;
-- CREATE SCHEMA e_commerce_dbms;