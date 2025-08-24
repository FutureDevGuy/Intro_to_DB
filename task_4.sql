-- This script queries the INFORMATION_SCHEMA to show details about the 'books' table.

-- Use the 'alx_book_store' database.
USE alx_book_store;

-- Select specific columns from the INFORMATION_SCHEMA.COLUMNS view
-- to get metadata about the columns in the 'books' table.
SELECT
    COLUMN_NAME,
    COLUMN_TYPE,
    IS_NULLABLE,
    COLUMN_KEY,
    COLUMN_DEFAULT,
    EXTRA
FROM
    INFORMATION_SCHEMA.COLUMNS
WHERE
    TABLE_NAME = 'books'
    AND TABLE_SCHEMA = 'alx_book_store';
