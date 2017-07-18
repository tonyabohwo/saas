---
layout: post
title:  "Nessus Container!"
date:   2015-07-27 10:04:22
categories: Nessus update
---

####PERSISTENT
docker run --name nessus_point -d -p 8834:8834  -v /var/operations/nessus captainovie/nessus:1.0.0

docker run --name nessus -d -p 8834:8834\
 10.0.1.6:5000/nessus:1.1.1


####MOUNT POINT
/var/operations/nessus

####PORT
8334

####URL
https://104.239.173.227:8334
