#!/bin/bash
# ./nmap_test.sh <host> | tee /var/log/nmap.log


RED='\033[0;31m'
host_to_scan=$1

if [ -z "$host_to_scan" ]; then
	echo "No Host Specified"
	echo "Usage: nmap_test [host]"
	host_to_scan=127.0.0.1
fi

echo -e "$RED Host To Scan: $host_to_scan \033[0m"

echo -e "$RED To check if nmap installed \033[0m"
cmd="nmap localhost"
echo $cmd
eval $cmd
echo $?

echo -e "$RED To get info about remote host ports and OS detection \033[0m"
cmd="nmap -sS -P0 -sV -O $host_to_scan"
echo $cmd
eval $cmd
echo $?

echo -e "$RED Scan ping \033[0m"
cmd="nmap -sS $host_to_scan"
echo $cmd
eval $cmd
echo $?

echo -e "$RED IP protocol scan \033[0m"
cmd="nmap -sO $host_to_scan"
echo $cmd
eval $cmd
echo $?

echo -e "$RED Port scan \033[0m"
cmd="nmap -p 22,80,443,110 $host_to_scan"
echo $cmd
eval $cmd
echo $?

echo -e "$RED Scan OS \033[0m"
cmd="nmap -O --osscan-guess $host_to_scan"
echo $cmd
eval $cmd
echo $?

#echo -e "$RED Scan entire subnet"
#cmd="nmap 162.242.228.32/24"
#echo $cmd
#eval $cmd
#echo $?

echo -e "$RED TCP SYNC Scan \033[0m"
cmd="nmap -sS $host_to_scan"
echo $cmd
eval $cmd
echo $?

echo -e "$RED UPD scan \033[0m"
cmd="nmap -sS $host_to_scan"
echo $cmd
eval $cmd
echo $?
