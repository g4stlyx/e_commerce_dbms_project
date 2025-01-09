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

# The products each user bought. ordered by user to see who bought what
SELECT
    u.id AS user_id,
    u.first_name AS user_first_name,
    p.name AS product_name,
    p.id AS product_id,
    COUNT(oi.product_id) AS purchase_count,
    o.id as order_id
FROM
    users u
JOIN
    orders o ON u.id = o.user_id
JOIN
    order_items oi ON o.id = oi.order_id
JOIN
    products p ON oi.product_id = p.id
GROUP BY
    u.id, u.first_name, p.id, p.name
ORDER BY u.id, p.name;

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

-- Orders per month
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS order_month,
    COUNT(*) AS order_count
FROM
    orders
GROUP BY
    order_month
ORDER BY
    order_month;

 -- Orders per year and month
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS order_month,				# to extract year and month from order_date
    YEAR(order_date) AS order_year,
    COUNT(*) AS order_count
FROM
    orders
GROUP BY
    order_month, order_year
ORDER BY
    order_year, order_month;
    
-- Order per day
SELECT
    DATE_FORMAT(order_date, '%Y-%m-%d') AS order_day,
    COUNT(*) AS order_count
FROM
    orders
GROUP BY
    order_day
ORDER BY
    order_day;
    
# which categories are most popular with customers (spending habits per category)
SELECT
     c.name AS category_name,
     SUM(oi.quantity * p.price) AS total_revenue
 FROM
     categories c
 JOIN
     products p ON c.id = p.category_id
 JOIN
     order_items oi ON p.id = oi.product_id
 GROUP BY
     c.name
 ORDER BY
     total_revenue DESC;

# which brands are most popular with customers (spending habits per brand)
SELECT
     p.brand,
     SUM(oi.quantity * p.price) AS total_revenue
 FROM
     products p
 JOIN
     order_items oi ON p.id = oi.product_id
GROUP BY
     p.brand
ORDER BY
     total_revenue DESC;

# classify users based on their spending or purchase frequency.
SELECT
    u.id AS user_id,
    u.first_name,
    u.last_name,
    COUNT(o.id) AS total_orders,
    SUM(o.total_price) AS total_spent,
    CASE
        WHEN SUM(o.total_price) > 1000 AND COUNT(o.id) > 3 THEN 'High Value & Frequent'
        WHEN SUM(o.total_price) > 500 THEN 'Mid Value'
        WHEN COUNT(o.id) > 1 THEN 'Frequent'
        ELSE 'Low Value & Inrequent'
    END AS customer_class
 FROM
    users u
LEFT JOIN
    orders o ON u.id = o.user_id
GROUP BY
    u.id, u.first_name, u.last_name
ORDER BY
     total_spent DESC, total_orders DESC;
     
# Filter orders by date range.
# i used date_format to remove time info from order_date
SELECT DATE_FORMAT(o.order_date, "%Y-%m-%d") as order_date, o.status, o.total_price, (SELECT username FROM users WHERE id=o.user_id) as user
FROM orders o
WHERE o.order_date > "2024-11-01" AND o.order_date < "2024-12-30"
ORDER BY order_date ASC;

# number of products bought in each category by each job.
SELECT
    CASE WHEN 
		u.job IS NULL THEN 'unemployed'
		ELSE u.job
		END AS job,
    c.name AS category_name,
    COUNT(oi.product_id) AS total_products_bought
FROM
    users u
JOIN
    orders o ON u.id = o.user_id
JOIN
    order_items oi ON o.id = oi.order_id
JOIN
    products p ON oi.product_id = p.id
JOIN
    categories c ON p.category_id = c.id
GROUP BY
    u.job, c.name
ORDER BY
    u.job, total_products_bought DESC;

# which job how many they spent
SELECT
	CASE WHEN 
		u.job IS NULL THEN 'unemployed'
		ELSE u.job
		END AS job_category,
	COUNT(*) AS a,
	SUM(o.total_price) AS total_spent
FROM
	users u
LEFT JOIN										# to get all users, even if they dont create any orders
	orders o ON u.id = o.user_id
GROUP BY
	job_category
ORDER BY
	total_spent DESC;

# products bought together
SELECT
	oi1.product_id AS product_id1,
	p1.name AS product_name1,
	oi2.product_id AS product_id2,
	p2.name AS product_name2,
	COUNT(*) AS count_of_orders
FROM 
	order_items oi1
JOIN 
	orders o ON oi1.order_id = o.id
JOIN 
	order_items oi2 ON o.id = oi2.order_id
JOIN 
	products p1 ON oi1.product_id = p1.id
JOIN 
	products p2 ON oi2.product_id = p2.id
WHERE 
	oi1.product_id < oi2.product_id					# aynı ürün çiftini iki kere yazmasın diye: [(p1,p2),(p2,p1)] olarak
GROUP BY 
	oi1.product_id, oi2.product_id
ORDER BY 
	count_of_orders DESC;
    
# earning by category and by month (hangi kategori hangi ay ne kadar satmış)
SELECT
	DATE_FORMAT(o.order_date, '%Y-%m') AS order_month,
	c.name AS category_name,
	SUM(oi.quantity * p.price) AS total_earning
FROM
	categories c
JOIN
	products p ON c.id = p.category_id
JOIN
	order_items oi ON p.id = oi.product_id
JOIN
	orders o ON oi.order_id = o.id
GROUP BY
	order_month, c.name
ORDER BY
	order_month, total_revenue DESC;