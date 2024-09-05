/*
 QUESTION:
 What is the most purchased item on the menu and how many times 
 was it purchased by all customers?
 */
SELECT customer_id,
    product_name,
    ct AS count
FROM (
        SELECT sales.customer_id,
            menu.product_name,
            COUNT(*) as ct,
            ROW_NUMBER() OVER(
                PARTITION BY customer_id
                ORDER BY COUNT(*) DESC
            ) AS flag
        FROM sales
            JOIN menu ON sales.product_id = menu.product_id
        GROUP BY sales.customer_id,
            menu.product_name
    )
WHERE flag = 1