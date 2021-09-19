FROM nginx:latest
RUN apt update && apt upgrade -y
RUN apt install php7.3 php7.3-fpm -y
RUN chown -R www-data:www-data /usr/share/nginx/html
RUN echo "<?php phpinfo(); ?>" > /usr/share/nginx/html/phpinfo.php
COPY . /usr/share/nginx/html
RUN rm /usr/share/nginx/html/index.html
RUN mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.backup
COPY nginx.conf /etc/nginx/conf.d/default.conf
RUN nginx -t
CMD service php5-fpm start && nginx