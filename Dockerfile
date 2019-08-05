FROM node:10.16.1

USER root
RUN mkdir /cder
COPY cder/cder /cder/cder
COPY deployer.sh /cder/deployer.sh
RUN chmod 777 /cder/cder
RUN chmod 777 /cder/deployer.sh
RUN apt update
RUN apt install nginx -y
EXPOSE 81
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT ["/cder/cder"]