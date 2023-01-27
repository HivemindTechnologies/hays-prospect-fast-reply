#!/bin/sh

# set -e

echo "Waiting for sql-server"
timeout 60 sh -c 'until /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -d master -Q "select 1;" -l 1 -t 1 > /dev/null 2>&1; do sleep 1; done'
echo "sql-server is up"

echo "Migrate PVS"
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -d master -i /sql/pvs.sql -m-1

echo "Migrations are done"
