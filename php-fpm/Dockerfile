FROM edissonsigua/almalinux8-php74:latest

RUN mkdir /run/php-fpm
COPY ./www.conf /etc/php-fpm.d/www.conf

ENV DATABASE_NAME=moodle
ENV DATABASE_HOST=moodle-db
ENV DATABASE_PORT=3306
ENV DATABASE_USERNAME=mdluser
ENV DATABASE_PASSWORD=edisson

ADD ./docker-entrypoint.sh /root/docker-entrypoint.sh
RUN chmod 500 /root/docker-entrypoint.sh
ENTRYPOINT ["/root/docker-entrypoint.sh"]

CMD [ "php-fpm", "-F", "-R" ]

# docker build -t edissonsigua/moodle-php .