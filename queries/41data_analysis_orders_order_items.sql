use e_commerce_dbms;

# kullanıcıların harcadığı toplam para, sipariş sayıları, ve sipariş başına ortalama harcadıkları
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

# kimin hangi ürünü ne kadar aldığını gösteriyor
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

# en çok para harcayan müşteriler, top 10
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

# hangi statüste kaç tane sipariş var?
SELECT 
    status,
    COUNT(*) AS order_count
FROM 
    orders
GROUP BY 
    status
ORDER BY 
    order_count DESC;

# en sık satın alınan ürünler, top 10
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

# hangi cinsiyet daha fazla para harcıyor, 
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

# sipariş geçmişi
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

-- aylık sipariş bilgisi
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS order_month,
    COUNT(*) AS order_count
FROM
    orders
GROUP BY
    order_month
ORDER BY
    order_month;
    
-- günlük sipariş bilgisi
SELECT
    DATE_FORMAT(order_date, '%Y-%m-%d') AS order_day,
    COUNT(*) AS order_count
FROM
    orders
GROUP BY
    order_day
ORDER BY
    order_day;
    
# en popüler(en çok gelir getiren) kategoriler
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

# en popüler(en fazla gelir getiren) markalar
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

# müşterileri ne kadar harcadıklarına ve ne sıklıkla alışveriş yaptıklarına göre sınıflandırma
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
        ELSE 'Low Value & Infrequent'
    END AS customer_class
 FROM
    users u
LEFT JOIN
    orders o ON u.id = o.user_id
GROUP BY
    u.id, u.first_name, u.last_name
ORDER BY
     total_spent DESC, total_orders DESC;
     
# girilen iki tarih arası verilmiş siparişler
# i used date_format to remove time info from order_date
SELECT DATE_FORMAT(o.order_date, "%Y-%m-%d") as order_date, o.status, o.total_price, (SELECT username FROM users WHERE id=o.user_id) as user
FROM orders o
WHERE o.order_date > "2024-11-01" AND o.order_date < "2024-12-30"
ORDER BY order_date ASC;

# hangi meslek hangi kategoriden kaç ürün almış
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

# hangi meslek ne kadar harcıyor?
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

# birlikte satın alınan ürünler
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