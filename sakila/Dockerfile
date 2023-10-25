FROM mysql:8.0.16

ENV MYSQL_ROOT_PASSWORD 1234

COPY ./sakila-schema.sql /docker-entrypoint-initdb.d/01.sakila-schema.sql
COPY ./sakila-data.sql /docker-entrypoint-initdb.d/02.sakila-data.sql