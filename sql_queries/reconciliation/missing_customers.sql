SELECT c.customer_id, c.customer_name
FROM crm c
LEFT JOIN sap s ON c.customer_id = s.customer_id
WHERE s.customer_id IS NULL;
