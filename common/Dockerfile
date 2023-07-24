FROM almalinux:8
RUN dnf update -y
RUN dnf install -y epel-release sudo crontabs
RUN dnf install -y https://rpms.remirepo.net/enterprise/remi-release-8.rpm
RUN dnf update -y
RUN dnf install -y vim rsync telnet htop net-tools wget screen procps sed sudo crontabs
RUN dnf module reset php -y
RUN dnf module enable php:remi-7.4 -y
RUN dnf install -y php php-pgsql php-iconv php-mbstring php-fpm php-curl php-tokenizer php-xmlrpc php-soap php-ctype php-zip php-simplexml php-spl php-pcre php-dom php-intl php-json php-xmlreader php-ldap php-redis php-memcached php-opcache php-mysqli php-xmlrpc php-gd php-sodium -y

RUN sed -i 's/^max_input_vars/;max_input_vars/g' /etc/php.ini
RUN sed -i '0,/^;max_input_vars.*$/s//max_input_vars = 5000/g' /etc/php.ini

RUN groupadd -g 3000 app
RUN adduser -u 3000 -g app app

# docker build -t edissonsigua/almalinux8-php74 .