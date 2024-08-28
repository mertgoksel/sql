/*
 QUESTION:
 How many days has each customer visited the restaurant?
 
 THOUGHTS:
 get the subquery for grouped dates then count them by customer_id
 */
SELECT 
    customer_id,
    COUNT(order_date) AS count
FROM 
    (
        SELECT customer_id,
            order_date
        FROM sales
        GROUP BY customer_id,
            order_date
    ) AS s
GROUP BY customer_id;