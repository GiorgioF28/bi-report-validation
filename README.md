# BI Report Validation Framework

SQL testing suite per validare report BI contro fonti simulate (CRM, SAP, Marketo).

## Descrizione progetto
Built a complete SQL testing suite to validate business reports against simulated CRM, SAP and Marketo data sources.

## Features
- 50+ reusable queries for data reconciliation, anomaly detection and business rule checks (SELECT, JOIN, aggregations)
- Performed full manual validation cycle and documented defects and test cases
- Python automation script that runs all checks and generates reports
- Reduced validation time by 40% with structured test approach (da 2 ore manuali a 45 minuti)

## Technologies
SQL · Python (pandas + sqlite3) · Excel · Git

## Come usare
1. `git clone ...`
2. `pip install pandas`
3. `python python/validate_reports.py`
4. Controlla cartella `reports/`

## Esempi
- [Total revenue reconciliation](sql_queries/reconciliation/total_revenue_check.sql)
- [Defects log](docs/defects_log.md)

Perfetto per ruoli QA Analyst / BI Testing.
