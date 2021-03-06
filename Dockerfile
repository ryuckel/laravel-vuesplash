FROM php:7.4.1-fpm

COPY install-composer.sh /
RUN apt-get update \
  && apt-get install -y gcc make vim wget git unzip libpq-dev libjpeg-dev libfreetype6-dev libmcrypt-dev gnupg \
  && : 'Install Node.js' \
  &&  curl -sL https://deb.nodesource.com/setup_12.x | bash - \
  && apt-get install -y nodejs \
  # libmagick++-dev \
  libmagickwand-dev \
  libpq-dev \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libpng-dev \
  libwebp-dev \
  libxpm-dev \
  && : 'Install PHP Extensions' \
  && docker-php-ext-install -j$(nproc) pdo_pgsql \
  && docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ \
  && docker-php-ext-install -j$(nproc) gd \
  && : 'Install Composer' \
  && chmod 755 /install-composer.sh \
  && /install-composer.sh \
  && mv composer.phar /usr/local/bin/composer

WORKDIR /var/www/html/vuesplash