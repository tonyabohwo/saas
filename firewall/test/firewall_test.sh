#!/bin/bash

# Start iptables
sudo service iptables start
status=$?
if test $status -eq 0
then
echo "PASSED"
else
echo "FAILED"
fi

# Check status of iptables
sudo service iptables status
status=$?
if test $status -eq 0
then
echo "PASSED"
else
echo "FAILED"
fi

# stop iptables
sudo service iptables stop
status=$?
if test $status -eq 0
then
echo "PASSED"
else
echo "FAILED"
fi
                  
# Restart iptables
sudo service iptables start
status=$?
if test $status -eq 0
then
echo "PASSED"
else
echo "FAILED"
fi


# Curl httpd to see if it returns web info (Please change ip to your machine's ip)
# On httpd_configure.sh i opened port 80 so when you try curl it should work.
sudo curl http://54.188.214.230/
status=$?
if test $status -eq 0
then
echo "PASSED"
else
echo "FAILED"
