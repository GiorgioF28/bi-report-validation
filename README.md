# BI Report Validation Framework

Framework SQL + Python per validare report BI su dataset simulati (CRM, SAP, Marketo).

## Obiettivo
Dimostrare un flusso end-to-end di BI testing:
- data reconciliation
- anomaly detection
- business rule validation
- generazione automatica report CSV

## Stack
- SQL (SQLite)
- Python (`pandas`, `sqlite3`)
- Git / GitHub

## Struttura progetto
```text
bi-report-validation-main/
  data/
    crm_customers.csv
    sap_sales.csv
    marketo_campaigns.csv
  sql_queries/
    reconciliation/
    anomaly_detection/
    business_rules/
  python/
    validate_reports.py
  reports/
  docs/
```

## Query incluse
- `reconciliation/total_revenue_check.sql`
- `reconciliation/missing_customers.sql`
- `anomaly_detection/duplicates.sql`
- `anomaly_detection/possible_fraud_orders.sql`
- `anomaly_detection/campaign_outliers.sql`
- `business_rules/high_value_orders.sql`
- `business_rules/customer_engagement_gap.sql`

## Come eseguire
1. Installa dipendenze:
```bash
pip install pandas
```
2. Esegui validazione:
```bash
python python/validate_reports.py
```
3. Controlla output in `reports/`.

## Output attesi (dataset corrente)
- `duplicates_result.csv`: order_id duplicati
- `possible_fraud_orders_result.csv`: clienti con ordini high-value sospetti
- `campaign_outliers_result.csv`: campagne con anomalie di conversione
- `high_value_orders_result.csv`: ordini > 300
- `customer_engagement_gap_result.csv`: clienti con gap ordini/campagne
- `missing_customers_result.csv`: clienti CRM senza vendite
- `total_revenue_check_result.csv`: riconciliazione totale ricavi

## Come pubblicarlo su GitHub
1. Inizializza repo locale (se non fatto):
```bash
git init
git add .
git commit -m "Initial BI validation framework"
```
2. Crea repository su GitHub (es. `bi-report-validation-framework`).
3. Collega remote e push:
```bash
git remote add origin <URL_REPO>
git branch -M main
git push -u origin main
```
4. Aggiorna la descrizione repo con keyword: `sql`, `bi-testing`, `data-quality`, `qa`.

## Miglioramenti consigliati
- aggiungere test automatici (pytest) sulle query chiave
- parametrizzare soglie anomalie via file config
- aggiungere CI (GitHub Actions) per eseguire validazione a ogni push
