#!/bin/bash

# Add protocol 2 - This has more security than v1
sudo sed 's/#Protocol 2/Protocol 2/' </etc/ssh/sshd_config> temp_file
status=$?
if test $status -eq 0
then
echo "PASSED"
else
echo "FAILED"
fi


sudo mv temp_file /etc/ssh/sshd_config
status=$?
if test $status -eq 0
then
echo "PASSED"
else
echo "FAILED"
fi


# AllowUsers - You put the users you want to allow here
sudo echo "AllowUsers root captain" >> /etc/ssh/sshd_config
status=$?
if test $status -eq 0
then
echo "PASSED"
else
echo "FAILED"
fi



#Use TCP Wrapper - We can set the IPs we want to allow here
sudo echo "sshd : 10.0.1.7" >> /etc/hosts.allow
status=$?
if test $status -eq 0
then
echo "PASSED"
else
echo "FAILED"
fi



#Disable root login
sudo sed 's/#PermitRootLogin yes/PermitRootLogin no/' </etc/ssh/sshd_config> temp_file
status=$?
if test $status -eq 0
then
echo "PASSED"
else
echo "FAILED"
fi


sudo mv temp_file /etc/ssh/sshd_config
status=$?
if test $status -eq 0
then
echo "PASSED"
else
echo "FAILED"
fi

