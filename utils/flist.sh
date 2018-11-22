#!/bin/bash
set -ex

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install lamp-server^ -y
apt-get install php-curl php-gd php-mbstring -y
apt-get install php-intl php-zip wget -y
apt-get install php-ldap php-apcu php-sqlite3 -y
apt-get install cron ssh -y

cd /var/www/html

wget https://www.humhub.org/en/download/package/humhub-1.3.7.tar.gz

tar xvf humhub-1.3.7.tar.gz
mv humhub-1.3.7 humhub

chmod 400 -R /etc/ssh/

service apache2 restart
service mysql start

mysql -e "CREATE DATABASE humhub CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
mysql -e "GRANT ALL ON humhub.* TO 'humhub'@'localhost' IDENTIFIED BY 'Hum_flist_hubB';"
mysql -e "FLUSH PRIVILEGES;"


wget https://raw.githubusercontent.com/threefoldgrid/freeflow/master/utils/mycron -O /root/mycron
#wget https://raw.githubusercontent.com/threefoldgrid/freeflow/master/utils/startup.toml -O /.startup.toml
wget https://raw.githubusercontent.com/threefoldgrid/freeflow/master/utils/IYO.php -O /var/www/html/humhub/protected/humhub/modules/user/authclient/IYO.php
wget https://raw.githubusercontent.com/threefoldgrid/freeflow/master/utils/common.php -O /var/www/html/humhub/protected/config/common.php

chmod -R 775 /var/www/
chown -R www-data:www-data /var/www/

tar -cpzf "/root/archives/humhub.tar.gz" --exclude dev --exclude sys --exclude proc  /
