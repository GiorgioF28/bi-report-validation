SELECT
  SUM(revenue) AS total_revenue,
  COUNT(DISTINCT order_id) AS unique_orders,
  COUNT(*) AS total_rows
FROM sap;
