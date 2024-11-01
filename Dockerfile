FROM    nginx:latest

COPY . /usr/share/nginx/html/

EXPOSE 80

#FROM httpd:latest

#COPY . /index.html /usr/local/apache2/htdocs/

#EXPOSE 80

#CMD ["httpd-foregroung"]