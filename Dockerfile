FROM debian:latest
RUN apt update && apt upgrade -y
RUN apt install apache2 php libapache2-mod-php -y
RUN chmod -R 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html 
RUN echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
COPY . /var/www/html
RUN rm /var/www/html/index.html
RUN service apache2 start