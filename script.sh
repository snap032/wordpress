#!/bin/bash
sudo apt-get update
sudo apt install nginx -y
sudo apt-get install mariadb-server mariadb-client -y
sudo apt-get install mc -y

sudo systemctl restart mysql.service
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php
sudo apt install php7.1-fpm php7.1-common php7.1-mbstring php7.1-xmlrpc php7.1-soap php7.1-gd php7.1-xml php7.1-intl php7.1-mysql php7.1-cli php7.1-mcrypt php7.1-zip php7.1-curl -y
sudo apt-get update






sed -i 's/memory_limit = 128M/memory_limit = 256M/' /etc/php/7.1/fpm/php.ini
sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 100M/' /etc/php/7.1/fpm/php.ini

sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/' /etc/php/7.1/fpm/php.ini

sed -i 's/max_execution_time = 30/max_execution_time = 360/' /etc/php/7.1/fpm/php.ini

#sed -i 's/;date.timezone =/date.timezone = Europe/Kiev/' /etc/php/7.1/fpm/php.ini

#Insert congif



sudo chown -R root:root /var/www/html/wordpress/
sudo chmod -R 755 /var/www/html/wordpress/


sudo systemctl restart nginx.service
