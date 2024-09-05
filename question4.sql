/*
 QUESTION:
 What is the most purchased item on the menu and how many times 
 was it purchased by all customers?
 */
WITH most_ordered_item AS (
    SELECT menu.product_name
    FROM sales
        JOIN menu ON sales.product_id = menu.product_id
    GROUP BY menu.product_name
    ORDER BY COUNT(*) DESC
    LIMIT 1
)
SELECT menu.product_name,
    sales.customer_id,
    COUNT(*) AS count
FROM sales
    JOIN menu ON sales.product_id = menu.product_id
WHERE menu.product_name = (
        SELECT product_name
        FROM most_ordered_item
    )
GROUP BY product_name,
    customer_id
ORDER BY customer_id