SELECT order_id, COUNT(*) AS duplicate_count
FROM sap
GROUP BY order_id
HAVING COUNT(*) > 1;
