SELECT customer_id, COUNT(*) as occurrences
FROM sap_sales
GROUP BY customer_id
HAVING COUNT(*) > 1;
