/*
 QUESTION:
 What was the first item from the menu purchased by each customer?
 
 THOUGHTS:
 First we need customer id, order, date. 
 Then we can groupby customer -> order by date -> pick the first row
 */
SELECT customer_id,
    order_date,
    product_name
FROM (
        SELECT sales.customer_id,
            sales.order_date,
            menu.product_name,
            ROW_NUMBER() OVER(
                PARTITION BY sales.customer_id
                ORDER BY sales.order_date ASC
            ) AS rn
        FROM sales
            JOIN menu ON sales.product_id = menu.product_id
    )
WHERE rn = 1