-- Which product was sold the most in March?
SELECT * FROM products
SELECT * FROM orders
SELECT * FROM order_items

-- order id tem no order e order_Item
-- product id tem no products e order_items

SELECT P.product_id, P.product_name, O.order_date, SUM(I.quantity) AS orders
FROM products P
INNER JOIN order_items I ON I.product_id = P.product_id
INNER JOIN orders O ON O.order_id = I.order_id
WHERE EXTRACT (MONTH FROM O.order_date::date) = 3
GROUP BY P.product_id, P.product_name, O.order_date, I.quantity
ORDER BY orders DESC
