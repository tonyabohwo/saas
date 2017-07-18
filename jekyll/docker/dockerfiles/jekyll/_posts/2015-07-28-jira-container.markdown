---
layout: post
title:  "Jira Container!"
date:   2015-07-27 10:04:22
categories: jira update
---

####PERSISTENT
docker run --name jira_vol -d -p 8081:8080 -v /var/data captainovie/jira_centos7:1.0.0

docker run --name jira -d -p 8081:8080\
 -v /mnt/hgfs/matrix/jira/data:/var/atlassian/application-data/jira \
 10.0.1.6:5000/jira:1.1.1

####Mount point 
/var/data

####Port 
81

####URL
http://23.253.49.233:8081