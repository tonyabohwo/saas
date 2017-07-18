## Install GitLab on centos 7

#####Step 1

######Install and configure the necessary dependencies
```
sudo yum install curl openssh-server
sudo systemctl enable sshd
sudo systemctl start sshd
sudo yum install postfix
sudo systemctl enable postfix
sudo systemctl start postfix
sudo firewall-cmd --permanent --add-service=http
sudo systemctl reload firewalld
```

#####Step 2
######Add the GitLab package server and install the package.

```
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash
sudo yum install gitlab-ce -y
```

#####Step 3
######Configure and start GitLab
```
sudo gitlab-ctl reconfigure
```

Go to http://ip_address:80
