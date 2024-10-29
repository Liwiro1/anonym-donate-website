A site that allows people who want to donate completely anonymously to donate using Monero

Although the idea of fully anonymous donations is a good idea, it is a project that cannot be used live because it will be a problem to use the page to sell normal products. It is a project I did in 3rd grade for my design course.

Installation Steps
1. Copy paste all files into your main folder of website
2. Import database
3. Ready for deploy

If you want more privacy you can uıse tor network here is how you can do with Ubuntu 22.04

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



Images
-----------------------------------------
![mainpage](https://github.com/user-attachments/assets/049ef734-30bd-432f-a196-d4fbea8b0f6e)
Main Page

![Kategori Sayfası](https://github.com/user-attachments/assets/e449a87e-00e1-429a-a353-50696cf56a5c)
Category Page

![productpage](https://github.com/user-attachments/assets/c9106ccb-8891-4979-bd84-bd878fb20a6b)
Product Page

![SSS](https://github.com/user-attachments/assets/3b642bc8-1598-496f-aa90-55b9e6ae3974)
FAQ

![kayıt](https://github.com/user-attachments/assets/e36c4be5-43bc-4023-bd5e-183bee34b00e)
Register

![login](https://github.com/user-attachments/assets/75040cd5-04b2-4903-8c1b-fc4e5201bfdb)
Login

![wallet](https://github.com/user-attachments/assets/5914f2e9-ec06-4ec8-b84e-7803b3b2f2f8)
Wallet

![sepet](https://github.com/user-attachments/assets/3b7dde6a-026f-4c9e-92d1-7f1bbef08cf6)
Basket

![orders](https://github.com/user-attachments/assets/0d31548d-b9ee-42c3-be3b-9cbc561a690f)
User Orders

![Users](https://github.com/user-attachments/assets/0354b57c-a744-4342-9762-231e39702691)
Admin Panel-Users

![Products](https://github.com/user-attachments/assets/fbdc6258-5135-44cb-837f-9ad86d33f4f2)
Admin Panel-Products

![adminorders](https://github.com/user-attachments/assets/f4f65135-fc3e-45dc-b112-66d2de0085af)
Admin Panel-Orders

![messages](https://github.com/user-attachments/assets/2c3fae06-1f30-41e8-8d87-e65014832390)
Admin Panel-Messages

![SSSekleme](https://github.com/user-attachments/assets/8d181d5d-ef60-483b-be64-e4249e0b06c9)
Admin Panel-Add/Delete FAQ 
