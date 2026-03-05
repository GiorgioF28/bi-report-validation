import sqlite3
import pandas as pd
import os

# Percorso robusto (funziona sempre)
script_dir = os.path.dirname(os.path.abspath(__file__))
project_root = os.path.dirname(script_dir)

print("Script eseguito da:", script_dir)
print("Root del progetto:", project_root)

# Crea cartella reports se non esiste
reports_dir = os.path.join(project_root, 'reports')
os.makedirs(reports_dir, exist_ok=True)

# Carica i CSV
crm = pd.read_csv(os.path.join(project_root, 'data', 'crm_customers.csv'))
sap = pd.read_csv(os.path.join(project_root, 'data', 'sap_sales.csv'))
marketo = pd.read_csv(os.path.join(project_root, 'data', 'marketo_campaigns.csv'))

print("[OK] Tutti i CSV caricati correttamente!")
print(f"Clienti: {len(crm)} righe")
print(f"Ordini SAP: {len(sap)} righe")
print(f"Campagne Marketo: {len(marketo)} righe")

# Crea DB SQLite in memory
conn = sqlite3.connect(':memory:')

# Carica i dati nel DB
crm.to_sql('crm', conn, index=False)
sap.to_sql('sap', conn, index=False)
marketo.to_sql('marketo', conn, index=False)

print("[OK] Database creato e popolato")

# ==================== ESECUZIONE QUERY ====================
queries = [
    os.path.join(project_root, 'sql_queries', 'reconciliation', 'total_revenue_check.sql'),
    os.path.join(project_root, 'sql_queries', 'reconciliation', 'missing_customers.sql'),
    os.path.join(project_root, 'sql_queries', 'anomaly_detection', 'duplicates.sql'),
    os.path.join(project_root, 'sql_queries', 'anomaly_detection', 'possible_fraud_orders.sql'),
    os.path.join(project_root, 'sql_queries', 'anomaly_detection', 'campaign_outliers.sql'),
    os.path.join(project_root, 'sql_queries', 'business_rules', 'high_value_orders.sql'),
    os.path.join(project_root, 'sql_queries', 'business_rules', 'customer_engagement_gap.sql')
]

for q_file in queries:
    if os.path.exists(q_file):
        with open(q_file, 'r') as f:
            query = f.read()
        
        result = pd.read_sql_query(query, conn)
        print(f"\nRisultati da {os.path.basename(q_file)}:")
        print(result)
        
        # Salva risultato in reports/
        result_filename = os.path.join(reports_dir, os.path.basename(q_file).replace('.sql', '_result.csv'))
        result.to_csv(result_filename, index=False)
    else:
        print(f"File non trovato: {q_file}")

print("\n[OK] Validazione completata - tutti i report generati nella cartella reports!")
