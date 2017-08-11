## Setting Up RabbitMQ On Centos 7

Step 1

Install the EPEL 

```
sudo yum install epel-release -y
```

Step 2.

Install erlang

```
sudo yum install erlang -y
```

Step 3.

Install RabbitMQ signing key

```
sudo rpm --import http://www.rabbitmq.com/rabbitmq-signing-key-public.asc
```

Step 4.

Install Socat a dependency for Latest RabbitMQ May 2017 release

```
sudo yum -y install socat 
```

Step 5.

Install RabbitMQ (May 2017 release)

```
sudo rpm -Uvh http://www.rabbitmq.com/releases/rabbitmq-server/current/rabbitmq-server-3.6.10-1.el6.noarch.rpm
```

Step 6.

Start RabbitMQ

```
sudo chkconfig rabbitmq-server on
sudo systemctl start rabbitmq-server.service
```

Step 7.

Enable RabbitMQ management console 

```
sudo rabbitmq-plugins enable rabbitmq_management
```

Confirm Status

```
sudo systemctl status rabbitmq-server.service
```

Step 8.

Create RabbitMQ user and password

```
sudo rabbitmqctl add_user admin password 
sudo rabbitmqctl set_user_tags admin administrator
sudo rabbitmqctl set_permissions -p / admin ".*" ".*" ".*"
```

Hit web interface for the url below
http://ip-addre:15672


