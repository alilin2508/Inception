FROM alpine:3.18

RUN apk update && apk upgrade && apk add	\
		openssl	\
		nginx	\
		curl	\
		vim		\
		sudo

RUN rm -f /etc/nginx/conf.d/default.conf
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /etc/nginx/ssl
COPY .env /etc/nginx/.env
RUN source /etc/nginx/.env && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/alilin.42.fr.key -out /etc/nginx/ssl/alilin.42.fr.crt -subj "/C=$COUNTRY/ST=$STATE/L=$LOCALITY/O=$ORGANIZATION/OU=$ORG_UNIT/CN=$COMMON_NAME"

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]