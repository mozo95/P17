#!/bin/bash


#https://github.com/mozo95/P17.git


#update repositorios
sudo apt-get -y update

#instalacion apache2
sudo apt-get -y install apache2

#habilitar apache via firewall
ufw allow in "Apache Full"

#indicamos las pass de mysql
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password root'


#instalacion mysql-server-5.5
sudo apt-get -y install mysql-server php-mysql

#instalacion php y dependencias
sudo apt-get -y install libapache2-mod-php

#instalacion adminer
sudo apt-get -y install adminer

sudo a2enconf adminer.conf

