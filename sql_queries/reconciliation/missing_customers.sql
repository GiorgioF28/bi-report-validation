SELECT c.customer_name, c.email
FROM crm_customers c
LEFT JOIN sap_sales s ON c.customer_id = s.customer_id
WHERE s.order_id IS NULL;
