---
layout: post
title:  "Owncloud Container!"
date:   2015-07-27 10:04:22
categories: jekyll update
---

#### PERSISTENT
docker run --name owncloud_pointt -d -p 443:443 -v /var/operations/owncloud captainovie/owncloud:1.1.0 

docker run --name owncloud -d -p 443:443 \
	-v /mnt/hgfs/matrix/owncloud/data:/var/lib/owncloud/data \
	-v /mnt/hgfs/matrix/owncloud/app:/var/lib/owncloud/app \
	10.0.1.6:5000/owncloud:1.1.1

####Mount point
/var/operations/owncloud 

####PORT
443

####URL
https://23.253.49.233/owncloud/
