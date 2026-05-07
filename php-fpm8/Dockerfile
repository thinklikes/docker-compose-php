ARG PHP_VERSION=8.4
FROM php:${PHP_VERSION}-fpm-alpine

ARG GROUP_ID=1000
ARG USER_ID=1000
ENV USER_NAME=www-data
ARG GROUP_NAME=www-data

RUN apk --no-cache add shadow && \
    usermod -u ${USER_ID} ${USER_NAME} -s /bin/bash && \
    groupmod -g ${USER_ID} ${GROUP_NAME}

# Install system dependencies
RUN set -eux; \
    apk add --no-cache \
    bash \
    git \
    openssh \
    curl \
    zip \
    unzip \
    tzdata

# Add docker php ext repo
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN set -eux; \
    chmod +x /usr/local/bin/install-php-extensions; \
    install-php-extensions \
    apcu \
    bcmath \
    decimal \
    exif \
    gd \
    igbinary \
    imagick \
    intl \
    lzf \
    opcache \
    pcntl \
    pdo_mysql \
    redis \
    timezonedb \
    uuid \
    xlswriter \
    yaml \
    zip

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Timezone
ARG TIMEZONE=UTC
ENV TZ=${TIMEZONE}
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone

USER www-data

# Copy aliases
COPY ./aliases.sh /home/www-data/aliases.sh

RUN sed -i 's/\r//' ~/aliases.sh && \
    echo "" >> ~/.bashrc && \
    echo "# Load Custom Aliases" >> ~/.bashrc && \
    echo "source ~/aliases.sh" >> ~/.bashrc && \
    echo "" >> ~/.bashrc

WORKDIR /var/www
