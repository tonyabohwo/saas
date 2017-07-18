
---
layout: post
title:  "Ejabberd Container!"
date:   2015-07-27 10:04:22
categories: jekyll update
---

####PERSISTENT
docker run --name ejabberd_point -d -p 5280:5280 -v /var/operations/ejabberd captainovie/ejabberd_ubuntu:1.0.0

docker run --name ejabberd -d \
	-p 5222:5222 -p 5269:5269 -p 5280:5280 \
	-v /mnt/hgfs/matrix/ejabberd/data:/var/lib/ejabberd \
	10.0.1.6:5000/ejabberd:1.1.1

####URL 
 http://10.0.1.20:5280/admin

####Mount point
/var/operations/ejabberd

####USERNAME AND PASSWORD
admin@localhost / Otoghor2015Bogije2015