FROM php:7.4.0-cli

ADD . /opt/demo

RUN apt-get update && apt-get -y install unzip

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /opt/demo
RUN composer install

ENTRYPOINT ["/usr/local/bin/php","-S","0.0.0.0:8000","-t","public"]
