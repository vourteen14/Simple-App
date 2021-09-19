FROM nginx:latest
RUN apt update && apt upgrade && apt install php -y
COPY index.php /usr/share/nginx/html
