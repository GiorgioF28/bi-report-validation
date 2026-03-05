SELECT order_id, COUNT(*) as occurrences
    FROM sap
    GROUP BY order_id
    HAVING COUNT(*) > 1