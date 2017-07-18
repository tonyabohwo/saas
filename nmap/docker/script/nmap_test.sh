exec &>> /var/log/nmap.log

#!/bin/bash
function go()
{

#To check if nmap installed
nmap localhost
echo $?

# Please note IPS used here are my IPS, so you have to put yours to replace mine
# To get info about remote host ports and OS detection
nmap -sS -P0 -sV -O 192.168.1.1
echo $?

# Scan ping
nmap -sS 162.242.228.32
echo $?

#IP protocol scan
nmap -sO 162.242.228.32
echo $?

#Port scan
nmap -p 22,80,443,110 162.242.228.32
echo $?

# Scan OS
nmap -O --osscan-guess 162.242.228.32
echo $?

# Scan entire subnet
#nmap 162.242.228.32/24
#echo $?

# TCP SYNC Scan
nmap -sS 162.242.228.32
echo $?

# UPD scan
nmap -sS 162.242.228.32
echo $?

}

while true
do
    go
done