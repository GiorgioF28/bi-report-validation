SELECT
    campaign_id,
    customer_email,
    clicks,
    conversions,
    ROUND(CASE WHEN clicks = 0 THEN 0 ELSE 1.0 * conversions / clicks END, 3) AS conversion_rate,
    CASE
        WHEN conversions > clicks THEN 'Data Quality Issue'
        WHEN clicks >= 100 AND conversions = 0 THEN 'Zero Conversion Anomaly'
        WHEN clicks >= 50 AND (1.0 * conversions / NULLIF(clicks, 0)) < 0.02 THEN 'Low Conversion Anomaly'
    END AS anomaly_type
FROM marketo
WHERE conversions > clicks
   OR (clicks >= 100 AND conversions = 0)
   OR (clicks >= 50 AND (1.0 * conversions / NULLIF(clicks, 0)) < 0.02);
