FROM php:7.3.9-cli-alpine3.10

RUN apk update && apk add --no-cache rabbitmq-c-dev libpng-dev

RUN apk add --no-cache php7-pear php7-dev gcc musl-dev make

RUN docker-php-ext-install bcmath pdo_mysql sockets gd exif
RUN pecl install amqp
RUN docker-php-ext-enable amqp

RUN apk del php7-pear php7-dev gcc musl-dev make

RUN chown -R www-data:www-data /var/www

WORKDIR /var/www/site