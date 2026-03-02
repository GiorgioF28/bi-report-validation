SELECT 
    ROUND(SUM(s.amount), 2) as total_sap_revenue,
    ROUND(SUM(m.conversions * 10), 2) as estimated_marketo_revenue  -- esempio business rule
FROM sap_sales s
LEFT JOIN crm_customers c ON s.customer_id = c.customer_id
LEFT JOIN marketo_campaigns m ON c.email = m.customer_email;
