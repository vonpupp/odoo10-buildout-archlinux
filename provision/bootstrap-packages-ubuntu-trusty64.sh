#!/usr/bin/env bash

# Atualizar pacotes
sudo apt-get update

# Pacotes principais
sudo apt-get install -y git python2.7 postgresql nano python-virtualenv \
    xfonts-75dpi wget postgresql

# Bibliotecas e pacotes de desenvolvimento
sudo apt-get install -y gcc python2.7-dev libxml2-dev \
    libxslt1-dev libevent-dev libsasl2-dev libldap2-dev libpq-dev \
    libpng12-dev libjpeg-dev libxmlsec1-dev npm

# Pacotes especificos do ubuntu xenial
sudo apt-get install -y nodejs-legacy fontconfig xfonts-base

# Bibliotecas do node
sudo npm install -g less

# Relatórios
mkdir /tmp/odoo
cd /tmp/odoo
wget http://ftp.us.debian.org/debian/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_1.3.1-12_amd64.deb
wget http://nightly.odoo.com/extra/wkhtmltox-0.12.1.2_linux-jessie-amd64.deb
sudo dpkg -i *.deb
cd -

# Ativar postgres
sudo /etc/init.d/postgres enable
sudo /etc/init.d/postgres start
