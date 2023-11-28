FROM alpine:3.18

ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_DATABASE

RUN apk add --no-cache mariadb mariadb-client

# Install MariaDB
COPY ./conf/my.cnf /etc
RUN rm -rf /etc/my.cnf.d \
	&& mkdir -p /run/mysqld \
	&& mysql_install_db

# Configure MariaDB
COPY ./tools/configure.sh .
RUN chmod +x configure.sh \
	&& ./configure.sh \
	&& rm -rf configure.sh

# Remove MariaDB client (was only needed for configuration)
RUN apk del mariadb-client

CMD ["mysqld"]
