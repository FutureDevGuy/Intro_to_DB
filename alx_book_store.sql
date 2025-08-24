#!/usr/bin/env python3
"""
Python script to connect to a MySQL server and create the 'alx_book_store' database.

This script demonstrates how to:
- Connect to a MySQL server without a specific database
- Execute a CREATE DATABASE query with a safety check
- Handle potential connection errors
- Close the database connection properly
"""

import mysql.connector
from mysql.connector import Error

def create_database(host_name, user_name, user_password, db_name):
    """
    Connects to a MySQL server and creates a new database.

    Args:
        host_name (str): The host address of the MySQL server.
        user_name (str): The username for the MySQL server.
        user_password (str): The password for the MySQL user.
        db_name (str): The name of the database to create.
    """
    connection = None
    try:
        # Establish a connection to the MySQL server
        # Do not specify a database name here, as we're creating it
        connection = mysql.connector.connect(
            host=host_name,
            user=user_name,
            password=user_password
        )

        if connection.is_connected():
            cursor = connection.cursor()
            
            # Use 'CREATE DATABASE IF NOT EXISTS' to prevent the script from failing
            # if the database already exists. The SQL keyword is in uppercase as requested.
            create_db_query = "CREATE DATABASE IF NOT EXISTS " + db_name
            
            # Execute the query to create the database
            cursor.execute(create_db_query)
            
            # Print success message as requested
            print(f"Database '{db_name}' created successfully!")
            
    except Error as e:
        # Handle and print any connection errors
        print(f"Error while connecting to MySQL or creating the database: {e}")

    finally:
        # Ensure the connection is closed in all cases
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed.")

if __name__ == '__main__':
    # --- IMPORTANT: Replace these with your actual MySQL credentials ---
    MYSQL_HOST = 'localhost'    # Or your server's IP address
    MYSQL_USER = 'your_username'
    MYSQL_PASSWORD = 'your_password'
    
    DATABASE_NAME = 'alx_book_store'

    create_database(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, DATABASE_NAME)
#!/usr/bin/env python3
"""
Python script to connect to a MySQL server and create the 'alx_book_store' database.

This script demonstrates how to:
- Connect to a MySQL server without a specific database
- Execute a CREATE DATABASE query with a safety check
- Handle potential connection errors
- Close the database connection properly
"""

import mysql.connector
from mysql.connector import Error

def create_database(host_name, user_name, user_password, db_name):
    """
    Connects to a MySQL server and creates a new database.

    Args:
        host_name (str): The host address of the MySQL server.
        user_name (str): The username for the MySQL server.
        user_password (str): The password for the MySQL user.
        db_name (str): The name of the database to create.
    """
    connection = None
    try:
        # Establish a connection to the MySQL server
        # Do not specify a database name here, as we're creating it
        connection = mysql.connector.connect(
            host=host_name,
            user=user_name,
            password=user_password
        )

        if connection.is_connected():
            cursor = connection.cursor()
            
            # Use 'CREATE DATABASE IF NOT EXISTS' to prevent the script from failing
            # if the database already exists. The SQL keyword is in uppercase as requested.
            create_db_query = "CREATE DATABASE IF NOT EXISTS " + db_name
            
            # Execute the query to create the database
            cursor.execute(create_db_query)
            
            # Print success message as requested
            print(f"Database '{db_name}' created successfully!")
            
    except Error as e:
        # Handle and print any connection errors
        print(f"Error while connecting to MySQL or creating the database: {e}")

    finally:
        # Ensure the connection is closed in all cases
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed.")

if __name__ == '__main__':
    # --- IMPORTANT: Replace these with your actual MySQL credentials ---
    MYSQL_HOST = 'localhost'    # Or your server's IP address
    MYSQL_USER = 'root'
    MYSQL_PASSWORD = 'Philliposeikhuemen@gmail.com'
    
    DATABASE_NAME = 'alx_book_store'

    create_database(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, DATABASE_NAME)
