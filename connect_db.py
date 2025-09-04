from dotenv import load_dotenv
import os
import mysql.connector

load_dotenv(dotenv_path=".env_credentials")

class Database:
    
    def __init__(self):
        self.host = os.getenv("db_host")
        self.user = os.getenv("db_user")
        self.password = os.getenv("db_password")
        self.port = int(os.getenv("db_port", 3306))
        self.database = os.getenv("database")
        self.conn = None
        self.cursor = None

    def connect(self):
        try:
            self.conn = mysql.connector.connect(
                host=self.host,
                user=self.user,
                password=self.password,
                port=self.port,
                database=self.database,
            )
            self.cursor = self.conn.cursor()
            print("\nConnected to database successfully!")
        except mysql.connector.Error as err:
            print(f"Error: {err}")
            self.conn = None
            self.cursor = None

    def close(self):
        if self.cursor:
            self.cursor.close()
        if self.conn:
            self.conn.close()
            print("MySQL connection closed.\n")
