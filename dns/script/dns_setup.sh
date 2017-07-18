#!/bin/bash

#Install bind packages
sudo yum install bind* -y
echo $?


# Add host name in /etc/hosts
sudo echo "104.130.170.87 dns1.captain.com" >> /etc/hosts 
echo $?

# Add server to /etc/resolv.conf file
cd /etc
rm -rf resolv.conf
sudo echo "nameserver 104.130.170.87" >> /etc/resolv.conf
cd
echo $?


# Step1 Edit /etc/named.conf and change lines 11,12 and 17 which I put info in block letter.
cd /etc/
rm -rf named.conf
cp named.txt named.conf
echo $?


# Step 2 Edit etc/named.rfc1912.zones
cd /etc/
rm -rf named.rfc1912.zones
cp named.rfc1912.zones.txt named.rfc1912.zones
echo $?


# step 4 edit /var/named/forward.zone, move the .txt files to /var/named
cd
cp /root/forward.zone.txt /var/named/forward.zone
echo $?

# Step5 Edit /var/named/reverse.zone 
cp /root/reverse.zone.txt /var/named/reverse.zone
echo $?

# Step 6 changing groups
chgrp named /var/named/forward.zone
echo $?

chgrp named /var/named/reverse.zone
echo $?