FROM alpine:latest

WORKDIR /src

RUN set -xe; \
    apk add \
        autoconf \
        bison \
        g++ \
        gcc \
        git \
        libxml2-dev \
        make \
        oniguruma-dev \
        openssl-dev \
        re2c \
        zlib-dev \
    ; \
    git clone https://github.com/php/php-src.git; \
    cd php-src; \
    ./buildconf; \
    ./configure \
        --enable-option-checking=fatal \
        --disable-all \
        --disable-cgi \
        --disable-phpdbg \
        --enable-ctype \
        --enable-dom \
        --enable-session \
        --enable-filter \
        --enable-json \
        --enable-mbstring \
        --enable-phar \
        --with-iconv \
        --with-libxml \
        --with-openssl \
        --with-zlib \
    ; \
    make --jobs=$(($(nproc)+1)); \
    make install; \
    php -v; \
    php -m; \
    wget --quiet --output-document composer-setup.php \
        https://raw.githubusercontent.com/composer/getcomposer.org/master/web/installer; \
    php composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer; \
    composer diagnose

COPY php.ini /usr/local/lib/php.ini
