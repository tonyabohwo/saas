#!/bin/bash

# Start named
sudo service named start
status=$?
if test $status -eq 0
then
echo "PASSED"
else
echo "FAILED"
fi

# Check status of named
sudo service named status
status=$?
if test $status -eq 0
then
echo "PASSED"
else
echo "FAILED"
fi

       
#Test using dig
sudo dig
status=$?
if test $status -eq 0
then
echo "PASSED"
else
echo "FAILED"
fi

