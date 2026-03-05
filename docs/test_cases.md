### Test Case 1 - Revenue Reconciliation
- Precondizione: dataset caricati in SQLite
- Query: `reconciliation/total_revenue_check.sql`
- Risultato atteso: `source_total_revenue = transformed_total_revenue`
- Esito attuale: PASS

### Test Case 2 - Missing Customers
- Precondizione: tabella CRM con clienti senza ordini
- Query: `reconciliation/missing_customers.sql`
- Risultato atteso: elenco clienti CRM non presenti in SAP
- Esito attuale: PASS

### Test Case 3 - Duplicate Orders
- Precondizione: ordine ripetuto con stesso `order_id`
- Query: `anomaly_detection/duplicates.sql`
- Risultato atteso: `order_id` con `occurrences > 1`
- Esito attuale: PASS

### Test Case 4 - Potential Fraud (High-Value Cluster)
- Precondizione: clienti con multipli ordini >= 500 in breve periodo
- Query: `anomaly_detection/possible_fraud_orders.sql`
- Risultato atteso: clienti flaggati per investigazione
- Esito attuale: PASS

### Test Case 5 - Campaign Outliers
- Precondizione: campagne con pattern anomali (es. conversioni > click)
- Query: `anomaly_detection/campaign_outliers.sql`
- Risultato atteso: campagne etichettate con anomaly type
- Esito attuale: PASS

### Test Case 6 - Engagement Gap
- Precondizione: clienti senza ordini o senza campagne
- Query: `business_rules/customer_engagement_gap.sql`
- Risultato atteso: classificazione gap per cliente
- Esito attuale: PASS
