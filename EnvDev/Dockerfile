FROM aveylon/projet_b3_docker:ubuntu1804


RUN apt-get update

RUN apt-get install -y apt-utils apache2 mysql-client

RUN rm -rf /var/lib/apt/lists/*

RUN chown -R www-data:www-data /var/www/

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
