#!/bin/bash
if [[ $EUID -ne 0 ]]; then
	echo "This script can only be executed as root" 1>&2
	exit 1
fi
echo "================================================INSTALLING DEPENDENCIES================================================"
yum -y install httpd httpd-devel 
yum -y install mysql mariadb-server 
yum -y install php php-cli php-common php-devel php-pear php-gd php-mbstring php-mysql php-xml
echo "================================================INITIALIZING SERVICES================================================"
service httpd start
service mariadb start
echo "================================================MYSQL SETUP================================================"
mysql_secure_installation
echo "================================================ADDING RPM================================================"
rpm -Uvh http://repo.zabbix.com/zabbix/2.2/rhel/7/x86_64/zabbix-release-2.2-1.el7.noarch.rpm
echo "================================================INSTALLING ZABBIX================================================"
yum -y install zabbix-server-mysql zabbix-web-mysql zabbix-agent zabbix-java-gateway
echo "================================================DONE================================================"
echo "Zabbix installed!"
