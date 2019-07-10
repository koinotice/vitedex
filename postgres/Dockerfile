FROM postgres:latest

COPY up.sql /docker-entrypoint-initdb.d/1.sql
COPY migrations/0001-init.up.sql /docker-entrypoint-initdb.d/2.sql
COPY migrations/seed.sql /docker-entrypoint-initdb.d/3.sql

CMD ["postgres"]
