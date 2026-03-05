SELECT order_id, customer_id, amount, order_date, 
           CASE WHEN amount > 300 THEN 'High Value' ELSE 'Standard' END AS order_category
    FROM sap
    WHERE amount > 300