#!/bin/bash

#install firewall
sudo yum install iptables -y
status=$?
if test $status -eq 0
then
echo "PASSED"
else
echo "FAILED"
fi

# Check iptables installed package and Version
sudo rpm -qa | grep iptables
status=$?
if test $status -eq 0
then
echo "PASSED"
else
echo "FAILED"
fi 

#You should see the following
#iptables-ipv6-1.4.7-5.1.el6_2.i686
#iptables-1.4.7-5.1.el6_2.i686