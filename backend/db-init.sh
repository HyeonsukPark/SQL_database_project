#!/bin/bash
set -e  # Exit immediately if a command fails
set -o pipefail

echo "Waiting for SQL Server to start..."

# Wait until SQL Server is available
until /opt/mssql-tools/bin/sqlcmd -S "${DB_HOST},${DB_PORT}" -U "${DB_USER}" -P "${DB_PASSWORD}" -Q "SELECT 1" > /dev/null 2>&1; do
    echo "SQL Server not ready yet, retrying in 2 seconds..."
    sleep 2
done

echo "SQL Server is up. Running database initialization script..."

# Run your SQL file (make sure the path is correct)
if /opt/mssql-tools/bin/sqlcmd -S "${DB_HOST},${DB_PORT}" -U "${DB_USER}" -P "${DB_PASSWORD}" -d "master" -i /app/database/vet_database.sql; then
    echo "Database initialized successfully!"
else
    echo "Database initialization failed!"
    exit 1
fi


