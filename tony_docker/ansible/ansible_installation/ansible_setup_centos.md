

##Setting up Ansible On Centos 6

#####Step 1

######Update yum repo

```
yum update -y
```
#####Step 2

######Install epel repository

```
rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
```

#####Step 3
###### install ansible

```
yum install ansible -y
```

#####Step 4

###### Copy pub key from ansible machine to authorized key for client, and copy over that of client to ansible too


#####Step 5
###### Edit /etc/ansible/hosts on the server machine which you have ansible installed on and put in your client category and ip address

```
vi /etc/ansible/hosts
```

#####It should look like this

```
[webserver]
1.1.1.1
```

#####Step 6 

######Test ping client from server to see if you are able to get to client

```
ansible -m ping client_name
```

This should respond with a "pong" response which confirms communictaion between the machines

##### To run a play book
######Go /etc/ansible/

```
ansible-playbook playbook_name.yml
``