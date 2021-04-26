#!/usr/bin/env bash

apt-get update

# Install basic packages
apt-get install -y vim curl build-essential python-software-properties git

# Install Apache2
apt-get install -y apache2

# Set DocumentRoot to /var/www
sed -i 's/\/var\/www\/html/\/var\/www/' /etc/apache2/sites-available/000-default.conf
service apache2 restart

# Setting MySQL root user password root/root
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

# Install MySql
apt-get install -y mysql-server

# Allow External Connections for MySQL
sudo sed -i -e 's/bind-addres/#bind-address/g' /etc/mysql/mysql.conf.d/mysqld.cnf
sudo sed -i -e 's/skip-external-locking/#skip-external-locking/g' /etc/mysql/mysql.conf.d/mysqld.cnf
mysql -u root -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root'; FLUSH privileges;"
sudo service mysql restart

# PHP and extensions
apt -y install software-properties-common
add-apt-repository -y ppa:ondrej/php
apt-get update
apt-get install -y php7.4 php7.4-fpm libapache2-mod-php7.4
apt-get install -y php7.4-curl php7.4-dom php7.4-gd php7.4-exif php7.4-fileinfo php7.4-imagick php7.4-json php7.4-mbstring php7.4-mysql php7.4-opcache php7.4-readline php7.4-xml php7.4-xdebug php7.4-zip

# Configure Xdebug
echo "xdebug.mode=debug" >> "/etc/php/7.4/fpm/conf.d/20-xdebug.ini"
echo "xdebug.client_host=192.168.34.1" >> "/etc/php/7.4/fpm/conf.d/20-xdebug.ini"
echo "xdebug.client_port=9003" >> "/etc/php/7.4/fpm/conf.d/20-xdebug.ini"

# Enable Rewrite Engin
a2enmod rewrite

systemctl restart apache2

php --version

apt-get install -y composer

mkdir -p "/home/vagrant/.composer"
chmod -R 777 "/home/vagrant/.composer"
