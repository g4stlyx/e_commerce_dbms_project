use e_commerce_dbms;

# number of orders, total money spent, and average money spent per order for each user.
SELECT 
    u.id AS user_id,
    u.first_name,
    u.last_name,
    COUNT(o.id) AS total_orders,
    SUM(o.total_price) AS total_spent,
    AVG(o.total_price) AS average_order_value
FROM 
	users u
LEFT JOIN 													# to include all users, event the ones they didnt create any orders 
	orders o ON u.id = o.user_id
GROUP BY 
	u.id, u.first_name, u.last_name
ORDER BY 
	total_orders DESC;

# users who spent the most, top 10
SELECT 
    u.id AS user_id,
    u.first_name,
    u.last_name,
    SUM(o.total_price) AS total_spent
FROM 
    users u
JOIN 
    orders o ON u.id = o.user_id
GROUP BY 
    u.id, u.first_name, u.last_name
ORDER BY 
    total_spent DESC
LIMIT 10; 

# number of orders for each status ("CREATED," "SHIPPED," "DELIVERED", "CANCELED")
SELECT 
    status,
    COUNT(*) AS order_count
FROM 
    orders
GROUP BY 
    status
ORDER BY 
    order_count DESC;

# products most frequently bought
SELECT 
    p.id AS product_id,
    p.name AS product_name,
    (SELECT name FROM categories WHERE p.category_id=id) as category,
    COUNT(oi.product_id) AS purchase_count
FROM 
    products p
JOIN 
    order_items oi ON p.id = oi.product_id
GROUP BY 
    p.id, p.name
ORDER BY 
    purchase_count DESC
LIMIT 10;

# average order total prices for each gender: which gender spends more in 1 order, and in total?
SELECT
     u.gender,
     AVG(o.total_price) AS average_order_total_price,
     SUM(o.total_price) AS total_spent
 FROM
     users u
 JOIN
     orders o ON u.id = o.user_id
 GROUP BY
    u.gender;

# order history of users
SELECT 
	u.id AS user_id, 
    u.first_name, 
    u.last_name, 
    o.id AS order_id, 
    o.order_date, 
    o.total_price, 
    o.status 
FROM 
	users u 
JOIN 
	orders o ON u.id = o.user_id 
ORDER BY 
	o.order_date, u.id;

# Further Analysis and Ideas
# Time-based analysis: Analyze orders over time (e.g., orders per month, year).
# Combine with product data: Analyze spending habits on specific categories or brands.
# User segmentation: Segment users based on their spending or purchase frequency.
# Compare order values for users with job or without a job.
# Filter orders by date range.
