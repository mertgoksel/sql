/*
 QUESTION:
 What is the total amount each customer spent at the restaurant?
 
 THOUGHTS:
 We have to get every line for every customer and their purchases with the item price, 
 then we can groupby with customer_id to aggregate the sum of the prices.
 */
 
SELECT 
    customer_id,
    SUM(COALESCE(price, 0)) AS total
FROM 
    (
        SELECT 
            sales.customer_id,
            menu.price
        FROM sales
            JOIN menu ON sales.product_id = menu.product_id
    ) AS s
GROUP BY customer_id
ORDER BY customer_id;