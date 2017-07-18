---
layout: post
title:  "Registry Container!"
date:   2015-08-31 10:04:22
categories: jekyll update
---

#### PERSISTENT

docker run -d -p 5000:5000 --restart=always --name registry \
  -v /mnt/hgfs/matrix/registry:/var/lib/registry \
  registry:2

sudo docker run \
  -d \
  -e ENV_DOCKER_REGISTRY_HOST=10.0.1.6 \
  -e ENV_DOCKER_REGISTRY_PORT=5000 \
  -p 8080:80 \
  konradkleine/docker-registry-frontend


####Mount point
/mnt/hgfs/matrix/registry

####Docker API PORT
443

####Docker Web UI Port
8080

####URL
https://10.0.1.20:8080