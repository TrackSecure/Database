FROM mysql:latest
WORKDIR /
ENV MYSQL_ROOT_PASSWORD=tracksecure
COPY ./src/ /docker-entrypoint-initdb.d/
EXPOSE 3306