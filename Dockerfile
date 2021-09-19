FROM nginx:latest
RUN apt update && apt upgrade -y
RUN apt install php
COPY index.php /usr/share/nginx/html
