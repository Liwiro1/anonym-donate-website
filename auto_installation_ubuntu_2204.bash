sudo su

sudo apt update

sudo apt upgrade -y

sudo apt install nginx -y

sudo apt install software-properties-common -y

sudo add-apt-repository ppa:ondrej/php

sudo apt install php8.1-fpm php8.1-common php8.1-dom php8.1-intl php8.1-mysql php8.1-xml php8.1-xmlrpc php8.1-curl php8.1-gd php8.1-imagick php8.1-cli php8.1-dev php8.1-imap php8.1-mbstring php8.1-soap php8.1-zip php8.1-bcmath -y

sudo apt-get install apt-transport-https curl -y

sudo curl -o /etc/apt/trusted.gpg.d/mariadb_release_signing_key.asc 'https://mariadb.org/mariadb_release_signing_key.asc'

sudo sh -c "echo 'deb https://mirrors.chroot.ro/mariadb/repo/10.9/ubuntu jammy main' >>/etc/apt/sources.list"

sudo apt-get install mariadb-server -y

mysql_secure_installation

---------------------------------

mysql_secure_installation

şifre

y
y

enter new password

n
n
n
y

----------------------------------

sudo service nginx stop
sudo service nginx start

wget -c https://files.phpmyadmin.net/phpMyAdmin/5.2.0/phpMyAdmin-5.2.0-all-languages.tar.gz

tar xzvf phpMyAdmin-5.2.0-all-languages.tar.gz

sudo mv phpMyAdmin-5.2.0-all-languages /usr/share/phpmyadmin

ln -s /usr/share/phpmyadmin /var/www/html

sudo nano /etc/nginx/sites-available/default

----------------------------------

Nginx

index.php

location ~ \.php$ {
  try_files $fastcgi_script_name =404;
  include fastcgi_params;
  fastcgi_pass  unix:/run/php/php8.1-fpm.sock;
  fastcgi_index index.php;
  fastcgi_param DOCUMENT_ROOT  $realpath_root;
  fastcgi_param SCRIPT_FILENAME   $realpath_root$fastcgi_script_name; 
}

-----------------------------------------

sudo service nginx stop
sudo service nginx start

sudo apt install tor -y

sudo nano /etc/tor/torrc

-----------------------------------------

Tor Config

hiddenservicedir uncommand
hiddenserviceport uncommand

-------------------------------------------

sudo service nginx stop
sudo service nginx start

sudo service tor stop
sudo service tor start

cd /var/www/html

rm index.nginx-debian.html 

git clone https://github.com/Liwiro1/tor-setup.git

cd tor-setup/

mv www.zip /var/www/html

cd ..

rm -r tor-setup/

sudo apt install unzip -y

unzip www.zip

rm www.zip

mysql

CREATE DATABASE tor_website;

exit

sudo service nginx stop
sudo service nginx start

sudo service tor stop
sudo service tor start

mysql -u root -p tor_website < /var/www/html/tor_website.sql

sudo service nginx stop
sudo service nginx start

sudo service tor stop
sudo service tor start

cat /var/lib/tor/hidden_service/hostname