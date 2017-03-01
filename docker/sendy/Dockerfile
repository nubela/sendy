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
  && mkdir -p /data/htdocs \
  && mkdir -p /data/logs/php-fpm \
  && rm -rf /var/cache/apk/* \
  && ln -sf /dev/stderr /data/logs/php-fpm/php-fpm.log \
  && ln -sf /dev/stdout /var/log/nginx/access.log \
  && ln -sf /dev/stderr /var/log/nginx/error.log

COPY files/nginx.conf /etc/nginx/
COPY files/php-fpm.conf /etc/php/
COPY files/sendy.conf /etc/nginx/conf.d/default.conf
COPY files/run.sh /run.sh
COPY files/sendy /data/htdocs/sendy

RUN chmod +x /run.sh

EXPOSE 80

WORKDIR /data/htdocs

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["/run.sh"]


