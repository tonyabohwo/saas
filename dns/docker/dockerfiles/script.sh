#!/bin/bash

#Install bind packages
sudo yum install bind* -y
echo $?


# Add host name in /etc/hosts
cd /etc
sudo echo "10.0.1.16 dns1.synologyeth0.com" >> /etc/hosts
echo $?

# Add server to /etc/resolv.conf file

sudo echo "nameserver 10.0.1.16" >> /etc/resolv.conf
echo $?


# Step1 Edit /etc/named.conf and change lines 11,12 and 17 which I put info in block letter.

rm -rf named.conf
cp named.txt named.conf
echo $?


# Step 2 Edit /etc/named.rfc1912.zones

rm -rf named.rfc1912.zones
cp named.rfc1912.zones.txt named.rfc1912.zones
echo $?


# step4 Copy forward.zone.txt to forward.zone

cp forward.zone.txt /var/named/forward.zone
echo $?

# Step5 Edit /var/named/reverse.zone
cp reverse.zone.txt /var/named/reverse.zone
echo $?

# Step 6 changing groups
chgrp named /var/named/forward.zone
echo $?

chgrp named /var/named/reverse.zone
echo $?
