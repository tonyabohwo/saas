---
layout: post
title:  "Jenkins Container!"
date:   2015-07-27 10:04:22
categories: jekyll update
---

####PERSISTENT
docker run --name jenkins_vol -d -p 8080:8080 -v /var/jenkins_home captainovie/jenkins:1.1.0  >> make it persistent

docker run --name jenkins -d -p 8000:8080 \
	-v /mnt/hgfs/matrix/jenkins/data:/root/.jenkins \
	10.0.1.6:5000/jenkins:1.1.1

####Mount point
/var/jenkins_home   

####Port
8080

####URL
http://23.253.49.233:8080/
