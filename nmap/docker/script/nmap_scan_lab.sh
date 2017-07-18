#!/bin/bash
# ./time nmap_test.sh <host> | tee /var/log/time nmap.log


# Discover IP's in a subnet (no root)
time nmap -sP 10.0.1.0/24

# Scan for open ports (no root)
time nmap 10.0.1.0/24

# Identify the Operating System of a host (requires root)
time nmap -O 10.0.1.0/24

# Identify Hostnames (no root)
time nmap -sL 10.0.1.0/24

# TCP Syn and UDP Scan (requires root)
time nmap -sS -sU -PN 10.0.1.0/24

# TCP SYN and UDP scan for all ports (requires root)
time nmap -sS -sU -PN -p 1-65535 10.0.1.0/24

# TCP Connect Scan (no root)
 time nmap -sT 10.0.1.0/24

# Aggressively Scan Hosts (no root)
time nmap -T4 -A 10.0.1.0/24

# Fast Scan (no root)
time nmap -T4 -F 10.0.1.0/24

# Verbose
time nmap -T4 -A -v 10.0.1.0/24

