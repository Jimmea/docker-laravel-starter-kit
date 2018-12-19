FROM php:7.2-fpm

RUN pecl install -o -f redis \
    && pecl install -o -f mongodb \
    && rm -rf /tmp/pear

RUN buildDeps=" \
    " \
    runtimeDeps=" \
        curl \
        libxslt-dev \
        mysql-client \
        libfreetype6-dev \
        libjpeg-dev \
        unzip \
    " \
    && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y $buildDeps $runtimeDeps\
    && docker-php-ext-install pdo_mysql xsl mbstring zip opcache pcntl\
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && apt-get purge -y --auto-remove $buildDeps \
    && rm -r /var/lib/apt/lists/*

ADD ./source/ /var/www
WORKDIR /var/www

# Install Composer.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
