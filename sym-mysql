#!/bin/bash
if [ ! -e /tmp/mysql.sock ]; 
then 
	echo "mysql.sock symlink not found, creating ...";
	ln -s /var/run/mysqld/mysqld.sock /tmp/mysql.sock;
else
	echo "mysql.sock symlink found";
fi
