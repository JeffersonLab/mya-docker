FROM mariadb:5.5.64

COPY ./docker-entrypoint-initdb.d/* /docker-entrypoint-initdb.d

ENV TZ='America/New_York'
ENV MYSQL_DATABASE=archive
ENV MYSQL_USER=myapi