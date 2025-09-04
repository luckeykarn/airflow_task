from connect_db import Database
from counting_duplicate_name import duplicate_name_query
from openpyxl import Workbook
from datetime import datetime

def run_doublename_report():

    db = Database()
    db.connect()
    db.cursor.execute(duplicate_name_query)

    #Fetch Data
    results = db.cursor.fetchall()
    columns = [desc[0] for desc in db.cursor.description]

    # print(f"Columns: {columns}")
    # print("Results:", results)

    wb = Workbook()
    ws = wb.active
    ws.title = "duplicate_name_query"

    ws.append(columns)
    print(columns)

    for row in results:
        ws.append(row)
        print(row)
    
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    wb.save(f"late_emp_{timestamp}.xlsx")
    
    db.close()

if __name__ == "__main__":
    run_doublename_report()
