SELECT 
        ROUND(SUM(amount), 2) AS source_total_revenue,
        (SELECT ROUND(SUM(amount), 2) FROM sap) AS transformed_total_revenue
    FROM sap