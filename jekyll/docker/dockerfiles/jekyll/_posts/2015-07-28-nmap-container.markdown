---
layout: post
title:  "Nmap Container!"
date:   2015-07-27 10:04:22
categories: Nmap update
---

####TO RUN, you run the image and the ip you want to scan

docker run -it captainovie/nmap:1.0.0 10.0.1.232

docker run --name nmap -d \
 10.0.1.6:5000/nmap:1.1.1


####Note 10.0.1.232 is an IP am scanning, so you apply IPs to be scanned 
