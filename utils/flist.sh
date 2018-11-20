#!/bin/bash
set -ex

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install lamp-server^ -y
apt-get install php-curl php-gd php-mbstring -y
apt-get install php-intl php-zip wget -y
apt-get install php-ldap php-apcu php-sqlite3 -y
apt-get install cron ssh

cd /var/www/html

wget https://www.humhub.org/en/download/package/humhub-1.3.7.tar.gz

tar xvf humhub-1.3.7.tar.gz
mv humhub-1.3.7 humhub

chown -R www-data:www-data /var/www/
chmod -R 775 /var/www/
chmod 400 -R /etc/ssh/

./etc/init.d/apache2 restart
/etc/init.d/mysql start

mysql -e "CREATE DATABASE humhub CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
mysql -e "GRANT ALL ON humhub.* TO 'humhub'@'localhost' IDENTIFIED BY 'OshotsAg5';"
mysql -e "FLUSH PRIVILEGES;"

cp utils/mycron /root/mycron
cp utils/startup.toml /.startup.toml
cp utils/IYO.php /var/www/html/humhub/protected/humhub/modules/user/authclient/IYO.php
cp utils/common.php /var/www/html/humhub/protected/config/common.php

tar -cpzf "/root/archives/humhub.tar.gz" --exclude dev --exclude sys --exclude proc  /
