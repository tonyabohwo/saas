https://www.linuxtechi.com/install-virtualbox-5-1-centos-7-rhel-7-fedora-26/


#Install EPEL repository for RHEL 7 / CentOS 7
sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

#Install kernel
sudo yum install kernel-devel kernel-headers dkms -y

#Install development tools
sudo yum groupinstall "Development Tools" -y

#Run update
sudo yum update -y

# Oracle public key
wget http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc

#Import Oracle public key
sudo rpm --import oracle_vbox.asc

#Download VirtualBox repo
sudo wget http://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo -O /etc/yum.repos.d/virtualbox.repo

#Install VirtualBox v5.2
sudo yum install VirtualBox-5.2 -y

#Rebuild the kernel
sudo service vboxdrv setup