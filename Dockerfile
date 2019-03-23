FROM ubuntu:latest
MAINTAINER fhause5@gmail.com

ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


RUN apt-get update && apt-get -y upgrade -y && apt-get -y install \
    nginx mc && apt-get install software-properties-common -y && add-apt-repository ppa:ondrej/php && apt update && apt-get -y install \
    php7.1-fpm php7.1-common php7.1-mbstring php7.1-xmlrpc php7.1-soap php7.1-gd php7.1-xml php7.1-intl php7.1-mysql php7.1-cli php7.1-mcrypt php7.1-zip php7.1-curl



RUN rm -rf /var/www/html/*
RUN rm -rf /etc/nginx/sites-available/*
RUN rm -rf /etc/nginx/sites-enabled/*
EXPOSE 8080

ADD /wordpress /var/www/html/
ADD wordpress1 /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/wordpress1 /etc/nginx/sites-enabled/

CMD ["nginx", "-g", "daemon off;"]
