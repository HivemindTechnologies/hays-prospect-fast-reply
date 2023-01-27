#!/bin/sh

/sql/import-data.sh &

/opt/mssql/bin/sqlservr
