#!/bin/bash


# Install libraries
yum install glibc zlib
status=$?
if test $status -eq 0
then
echo "PASSED"
else
echo "FAILED"
fi


#Download Nessus
wget https://s3.amazonaws.com/bionicpulse/Nessus-6.4.3-es7.x86_64.rpm
status=$?
if test $status -eq 0
then
echo "PASSED"
else
echo "FAILED"
fi


#Install Nessus
rpm -ivh Nessus-6.4.3-es7.x86_64.rpm
status=$?
if test $status -eq 0
then
echo "PASSED"
else
echo "FAILED"
fi


cd /sbin/
status=$?
if test $status -eq 0
then
echo "PASSED"
else
echo "FAILED"
fi


# Start nessusd
service nessusd start  
status=$?
if test $status -eq 0
then
echo "PASSED"
else
echo "FAILED"
fi


