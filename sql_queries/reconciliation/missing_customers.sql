SELECT c.customer_name, c.email
    FROM crm c
    LEFT JOIN sap s ON c.customer_id = s.customer_id
    WHERE s.order_id IS NULL