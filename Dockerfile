#FROM    nginx:latest

#COPY . /usr/share/nginx/html/

#EXPOSE 80

FROM httpd:latest

COPY . /usr/local/apache2#

EXPOSE 80