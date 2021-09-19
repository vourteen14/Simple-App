FROM nginx:latest
RUN apt update && apt upgrade && apt install php7.3 php7.3-fpm -y
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:ondrej/php
RUN rm /usr/share/nginx/html/index.html
RUN chmod -R 755 /usr/share/nginx/html
COPY nginx-site.conf /etc/nginx/sites-enabled/default
COPY --chown=www-data:www-data . /usr/share/nginx/html