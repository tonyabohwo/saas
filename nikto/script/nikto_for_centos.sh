#!/bin/bash
#THIS RUNS ON CENTOS 6

sudo yum install python-pip -y
echo $?

sudo pip install --upgrade pip
echo $?

sudo wget https://cirt.net/nikto/nikto-2.1.5.tar.gz
echo $?

sudo tar -zxvf nikto-2.1.5.tar.gz
echo $?

cd ~
echo $?

sudo cp -apvf nikto-2.1.5/* /usr/local/bin/
echo $?

sudo ls -l /usr/local/bin/
echo $?

sudo ln -s /usr/local/bin/nikto.conf /etc/nikto.conf
echo $?

sudo chmod 755 /usr/local/bin/nikto.pl
echo $?

sudo /usr/local/bin/nikto.pl -update 
echo $?

#List plugins
nikto.pl -list-plugins
echo $?