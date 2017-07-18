#!/bin/bash

# Create firewall rules /etc/sysconfig/iptables and add default rules.
# Note you can add rule -A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT, so you can add a rule following the format.

echo "# Firewall configuration written by system-config-firewall" >> /etc/sysconfig/iptables
echo "# Manual customization of this file is not recommended "  >> /etc/sysconfig/iptables
echo "*filter"  >> /etc/sysconfig/iptables
echo ":INPUT ACCEPT [0:0]"  >> /etc/sysconfig/iptables
echo ":INPUT ACCEPT [0:0]"  >> /etc/sysconfig/iptables
echo "-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT"  >> /etc/sysconfig/iptables
echo "-A INPUT -p icmp -j ACCEPT"  >> /etc/sysconfig/iptables
echo "-A INPUT -i lo -j ACCEPT"  >> /etc/sysconfig/iptables
echo "-A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT"  >> /etc/sysconfig/iptables
echo "-A INPUT -j REJECT --reject-with icmp-host-prohibited"  >> /etc/sysconfig/iptables
echo "-A FORWARD -j REJECT --reject-with icmp-host-prohibited"  >> /etc/sysconfig/iptables
echo "-A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT"  >> /etc/sysconfig/iptables
echo "-A INPUT -m state --state NEW -m tcp -p tcp --dport 3306 -j ACCEPT"  >> /etc/sysconfig/iptables
echo "COMMIT"  >> /etc/sysconfig/iptables
status=$?
if test $status -eq 0
then
echo "PASSED"
else
echo "FAILED"
fi



