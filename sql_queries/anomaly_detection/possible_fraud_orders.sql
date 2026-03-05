SELECT
    customer_id,
    COUNT(*) AS high_value_orders,
    ROUND(SUM(amount), 2) AS total_high_value_amount,
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date
FROM sap
WHERE amount >= 500
GROUP BY customer_id
HAVING COUNT(*) >= 2 OR SUM(amount) >= 1200;
