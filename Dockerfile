FROM php:7.3.13-cli-alpine3.10

RUN apk update && apk add --no-cache rabbitmq-c-dev libpng-dev \
        php7-pear php7-dev gcc musl-dev make && \
    docker-php-ext-install bcmath pdo_mysql sockets gd exif pcntl && \
    pecl install amqp && \
    docker-php-ext-enable amqp && \
    apk del php7-pear php7-dev gcc musl-dev make && \
    chown -R www-data:www-data /var/www

WORKDIR /var/www/site
