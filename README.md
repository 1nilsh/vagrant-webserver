# Vagrant Webserver

Es wird ein Webserver unter [192.168.34.10](http://192.168.34.10/) gestartet.

**(Optional)** Eintrag in die hosts Datei

```
192.168.34.100   vagrant.local
```

Das Wurzelverzeichnis des apache Webservers liegt in `/var/www/` in der Vagrant-Box
bzw. in `./www/` in diesem Ordner.

## Installierte Pakete
```
vim curl build-essential python-software-properties git apache2 php7.4
```

### PHP Plugins
```
php7.4
php7.4-fpm
libapache2-mod-php7.4
php7.4-curl
php7.4-dom
php7.4-gd
php7.4-exif
php7.4-fileinfo
php7.4-imagick
php7.4-json
php7.4-mbstring
php7.4-mysql
php7.4-opcache
php7.4-readline
php7.4-xml
php7.4-xdebug
php7.4-zip
```

## Accounts

* MySQL `root:root`
