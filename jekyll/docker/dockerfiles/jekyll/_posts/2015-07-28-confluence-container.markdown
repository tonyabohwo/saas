---
layout: post
title:  "Confluence Container!"
date:   2015-07-27 10:04:22
categories: jekyll update
---
####PERSISTENT
docker run --name confluence_point -d -p 8090:8090 -v /var/operations/confluence captainovie/confluence:1.0.0

docker run --name confluence -d \
 -p 8090:8090 \
 -v /mnt/hgfs/matrix/confluence/data:/var/atlassian/application-data/confluence \
 10.0.1.6:5000/confluence:1.1.1


####MOUNT POINT
/var/operations

####PORT 
8090

####URL
 http://23.253.49.231:8090