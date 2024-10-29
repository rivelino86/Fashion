#FROM    nginx:latest

#COPY . /usr/share/nginx/html/

#EXPOSE 80

FROM httpd:latest

COPY . /var/www/index.html/

EXPOSE 80