#!/bin/bash

# install httpd
sudo yum install httpd -y
status=$?
if test $status -eq 0
then
echo "PASSED"
else
echo "FAILED"
fi
