SELECT
    c.customer_id,
    c.customer_name,
    c.email,
    COALESCE(s.order_count, 0) AS order_count,
    COALESCE(m.campaign_count, 0) AS campaign_count,
    CASE
        WHEN COALESCE(s.order_count, 0) = 0 AND COALESCE(m.campaign_count, 0) = 0 THEN 'No Orders + No Campaign'
        WHEN COALESCE(s.order_count, 0) = 0 THEN 'No Orders'
        WHEN COALESCE(m.campaign_count, 0) = 0 THEN 'No Campaign'
    END AS gap_type
FROM crm c
LEFT JOIN (
    SELECT customer_id, COUNT(*) AS order_count
    FROM sap
    GROUP BY customer_id
) s ON c.customer_id = s.customer_id
LEFT JOIN (
    SELECT customer_email, COUNT(*) AS campaign_count
    FROM marketo
    GROUP BY customer_email
) m ON c.email = m.customer_email
WHERE COALESCE(s.order_count, 0) = 0
   OR COALESCE(m.campaign_count, 0) = 0
ORDER BY c.customer_id;
