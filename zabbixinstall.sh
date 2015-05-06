#!/bin/bash
echo Agregando PPA a APT...
echo deb http://ppa.launchpad.net/tbfr/zabbix/ubuntu precise main >> /etc/apt/sources.list
echo deb-src http://ppa.launchpad.net/tbfr/zabbix/ubuntu precise main >> /etc/apt/sources.list
apt-key	adv --keyserver keys.ubuntu.com --recv-keys C407E17D5F76A32B
echo Actualizando respositorios...
apt-get update
apt-get -y install zabbix-server-mysql php5-mysql zabbix-frontend-php
