FROM php:7.3.9-cli-alpine3.10

RUN apk update && apk add rabbitmq-c-dev

RUN apk add php7-pear php7-dev gcc musl-dev make

RUN docker-php-ext-install bcmath pdo_mysql sockets
RUN pecl install amqp
RUN docker-php-ext-enable amqp

RUN chown -R www-data:www-data /var/www

WORKDIR /var/www/site