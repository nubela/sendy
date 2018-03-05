# Original credit: https://github.com/ball6847/docker-alpine-nginx-php-mysql

FROM alpine:3.5
MAINTAINER Andrey N. Petrov <andreynpetrov@gmail.com>

RUN apk add --update \
      bash \
      ca-certificates \
      nginx \
      php5-ctype \
      php5-curl \
      php5-dom \
      php5-fpm \
      php5-gd \
      php5-gettext \
      php5-iconv \
      php5-json \
      php5-json \
      php5-mcrypt \
      php5-mysqli \
      php5-openssl \
      php5-openssl \
      php5-pdo \
      php5-pdo_mysql \
      php5-phar \
      php5-xml \
      php5-zlib \
      dumb-init \
  && mkdir -p /etc/nginx/conf.d \
  && rm -rf /var/cache/apk/* \
  && ln -sf /dev/stdout /var/log/nginx/access.log \
  && ln -sf /dev/stderr /var/log/nginx/error.log

COPY files/nginx.conf /etc/nginx/nginx.conf
COPY files/ssl.conf /etc/nginx/ssl.conf
COPY files/php-fpm.conf /etc/php/php-fpm.conf
COPY files/php.ini /etc/php5/php.ini
COPY files/sendy.conf /etc/nginx/conf.d/default.conf
COPY files/sendy /data/htdocs/sendy
COPY files/run.sh /

RUN chmod +x /run.sh

EXPOSE 80

WORKDIR /data/htdocs

VOLUME ["/data/htdocs", "/data/logs"]

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["/run.sh"]


