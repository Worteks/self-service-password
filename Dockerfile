FROM php:7.2-apache
# Install PHP extensions and PECL modules.
RUN buildDeps=" \
        libbz2-dev \
        libsasl2-dev \
        libcurl4-gnutls-dev \
    " \
    runtimeDeps=" \
        curl \
        libicu-dev \
        libldap2-dev \
        libzip-dev \
    " \
    && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y $buildDeps $runtimeDeps \
    && docker-php-ext-install bcmath bz2 iconv intl mbstring opcache curl \
    && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
    && docker-php-ext-install ldap \
    && pecl install psr-1.0.0 \
    && echo extension=/usr/local/lib/php/extensions/no-debug-non-zts-20170718/psr.so \
	>/usr/local/etc/php/conf.d/psr.ini \
    && apt-get purge -y --auto-remove $buildDeps \
    && rm -r /var/lib/apt/lists/* \
    && a2enmod rewrite
RUN mkdir -p /usr/share/php/smarty3/ && \
    curl -Lqs https://github.com/smarty-php/smarty/archive/v3.1.35.tar.gz | \
    tar xzf - -C /usr/share/php/smarty3/ --strip-components=2
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
COPY . /var/www
RUN rmdir /var/www/html && \
    mv /var/www/htdocs /var/www/html && \
    mkdir -p /var/www/templates_c && \
    chown -R www-data: /var/www/templates_c && \
    if test "$WITH_PHPUNIT"; then \
	curl -o /usr/bin/phpunit -fsL https://phar.phpunit.de/phpunit-8.phar && \
	chown root:root /usr/bin/phpunit && \
	chmod 755 /usr/bin/phpunit; \
    fi

EXPOSE 80
