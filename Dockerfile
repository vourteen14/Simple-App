FROM nginx:latest
RUN apt update && apt upgrade && apt install php -y
RUN rm /usr/share/nginx/html/index.html
RUN cp index.php /usr/share/nginx/html
RUN chown -R www-data:www-data /usr/share/nginx/html
