
### INSTALLING ANSIBLE ON MAC OS

####Note: Please run as root

####Step 1
 
 
###### Install pip

```
easy_install pip
```
###### Install ansible via pip
```
pip install ansible
```
######Update Ansible

```
pip install ansible --upgrade
```

######If you are installing on OS X Mavericks, you may encounter some noise from your compiler. A workaround is to do the following:

```
CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments pip install ansible
```

#### Step 2

Copy pub key from ansible machine to authorized key for client, and copy over that of client to ansible too


#### Step 3
Create a host file in this path, /etc/ansible/hosts. Note /etc/ansible/ path is not created by default for mac installation, so you have to create the path and put your host file in it and edit.

######It should look like this:

```
[webserver]
1.1.1.1
```

Step 6

######Test, ping client from server to see if you are able to get to client, this would ask for password and you are to supply the password of the machine you are trying to ping

```
ansible -m ping client_name
             or 
ansible all -m ping --ask-pass
```

######To run a playbook Go /etc/ansible/ and create the playbook in this path, then run with the following command

```
ansible-playbook playbook_name.yml
```
