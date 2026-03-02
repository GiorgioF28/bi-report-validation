import sqlite3
import pandas as pd

# Carica dati
crm = pd.read_csv('data/crm_customers.csv')
sap = pd.read_csv('data/sap_sales.csv')
marketo = pd.read_csv('data/marketo_campaigns.csv')

# Crea DB SQLite
conn = sqlite3.connect(':memory:')
crm.to_sql('crm', conn, index=False)
sap.to_sql('sap', conn, index=False)
marketo.to_sql('marketo', conn, index=False)

# Esegui tutte le query di reconciliation e salva risultati
queries = ['sql_queries/reconciliation/total_revenue_check.sql', 
           'sql_queries/reconciliation/missing_customers.sql',
           'sql_queries/anomaly_detection/duplicates.sql']

for q_file in queries:
    with open(q_file, 'r') as f:
        query = f.read()
    result = pd.read_sql_query(query, conn)
    print(f"Risultati da {q_file}:")
    print(result)
    result.to_csv(f"reports/{q_file.split('/')[-1].replace('.sql','_result.csv')}", index=False)

print("✅ Validazione completata - report generati!")
