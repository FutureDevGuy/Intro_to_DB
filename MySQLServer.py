#!/usr/bin/python3
"""
A simple Python script to create the 'alx_book_store' database in a MySQL server.

The script connects to the MySQL server, creates the database if it doesn't already
exist, and handles potential connection errors.
"""

import mysql.connector
from mysql.connector import errorcode

# Database configuration. You will need to replace these with your credentials.
# Note: Use a dedicated user with minimal permissions in a production environment.
config = {
    'user': 'root',
    'password': 'Philliposeikhuemen@gmail.com', # Replace with your MySQL root password
    'host': 'localhost',
}

DB_NAME = 'alx_book_store'

def create_database(cursor):
    """
    Creates the specified database if it does not exist.
    """
    try:
        # Use a parameterized query to create the database.
        # This is generally safer, although for a database name it's less critical.
        # Execute is preferred over an f-string to prevent SQL injection vulnerabilities
        # in more complex queries.
        cursor.execute(f"CREATE DATABASE IF NOT EXISTS {DB_NAME}")
        print(f"Database '{DB_NAME}' created successfully!")
    except mysql.connector.Error as err:
        # Handle specific MySQL errors if they occur during database creation
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Something is wrong with your user name or password")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Database does not exist")
        else:
            print(f"Failed creating database: {err}")

def main():
    """
    Main function to handle the database connection and creation.
    """
    conn = None
    try:
        # Establish a connection to the MySQL server
        conn = mysql.connector.connect(**config)
        cursor = conn.cursor()

        # Call the function to create the database
        create_database(cursor)

        # Close the cursor and connection
        cursor.close()
    except mysql.connector.Error as err:
        # Handle errors that occur during the initial connection
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Something is wrong with your user name or password")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Database does not exist")
        else:
            print(f"Error: {err}")
    finally:
        # Ensure the connection is closed even if an error occurs
        if conn and conn.is_connected():
            conn.close()
            print("Database connection closed.")

if __name__ == "__main__":
    main()
