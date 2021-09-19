FROM nginx:latest
RUN apt update && apt upgrade -y
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:ondrej/php
RUN apt install php php-fpm -y
RUN chmod -R 755 /var/www/html
RUN service php7.3-fpm start
RUN echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
COPY nginx-site.conf /etc/nginx/sites-enabled/default
COPY --chown=www-data:www-data . /var/www/html