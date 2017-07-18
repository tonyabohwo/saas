#!/bin/bash
# In here, am setting logs to rotate on a daily basis, and it should keep the last 5 log files

cd /etc/logrotate.d
status=$?
if test $status -eq 0
then
echo "PASSED"
else
echo "FAILED"
fi

rm -rf fail2ban
status=$?
if test $status -eq 0
then
echo "PASSED"
else
echo "FAILED"
fi

cp fail2ban fail2ban
status=$?
if test $status -eq 0
then
echo "PASSED"
else
echo "FAILED"
fi
