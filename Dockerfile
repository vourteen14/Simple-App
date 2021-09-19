FROM nginx:latest
RUN apt update && apt upgrade && apt install php -y
RUN rm /usr/share/nginx/html/index.html
COPY index.php /usr/share/nginx/html
COPY nginx-site.conf /etc/nginx/sites-enabled/default
COPY --chown=www-data:www-data . /usr/share/nginx/html
