FROM mcr.microsoft.com/mssql/server:2017-latest

COPY entrypoint.sh /entrypoint.sh

COPY sql /sql

ENTRYPOINT [ "./entrypoint.sh" ]
