#!/bin/bash

#run yum update
yum update -y
status=$?
if test $status -eq 0
then
echo "PASSED"
else
echo "FAILED"
fi

wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
status=$?
if test $status -eq 0
then
echo "PASSED"
else
echo "FAILED"
fi

rpm -ivh epel-release-7-5.noarch.rpm
status=$?
if test $status -eq 0
then
echo "PASSED"
else
echo "FAILED"
fi

#Install fail2ban
sudo yum install fail2ban -y
status=$?
if test $status -eq 0
then
echo "PASSED"
else
echo "FAILED"
fi

#Add jail.conf file locally
sudo cp jail.local /etc/fail2ban/jail.local
status=$?
if test $status -eq 0
then
echo "PASSED"
else
echo "FAILED"
fi


#start fail2ban
sudo service fail2ban restart
status=$?
if test $status -eq 0
then
echo "PASSED"
else
echo "FAILED"
fi
