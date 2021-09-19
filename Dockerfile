FROM nginx:latest
RUN apt install php php-fpm -y
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:ondrej/php
RUN chmod -R 755 /var/www/html
RUN echo "<?php phpinfo(); ?>" > /var/www/html/info.php
COPY nginx-site.conf /etc/nginx/sites-enabled/default
COPY --chown=www-data:www-data . /var/www/html