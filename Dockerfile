FROM node:10.16.1

RUN mkdir /cder
COPY cder /cder/cder
RUN chmod 777 /cder/cder
RUN sudo apt update
RUN sudo apt install nginx
EXPOSE 81
RUN sudo ufw allow 'Nginx Full'
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT ["/cder/cder"]
