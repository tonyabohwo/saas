Installing Kubernetes Master On Centos 7


#STEP 1
``` 
swapoff -a
```
 
#Update yum
```
yum update -y
```
 
#Install Docker, Enable and Start
```
yum -y install docker  (if you already have docker, kindly skip this)
systemctl enable docker
systemctl start docker
```
 
#Add kubernetes.repo  to /etc/yum.repos.d

```
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
```

STEP 2
#set selinux
```
setenforce 0
```
 
#Edit selinux and make sure SELINUX=permissive and not SELINUX=enforcing
```
vi /etc/selinux/config
```

#Install kubelet kubeadm kubectl
```
yum -y install kubelet kubeadm kubectl
```
 
#start and enable kubelet
```
systemctl enable kubelet
systemctl start kubelet
``` 
#Add k8s.conf
```
cat <<EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
``` 
#making sure changes take effect
```
sysctl --system
```
 
STEP 3
#Network cider
```
kubeadm init --pod-network-cidr=10.244.0.0/16
```
 
Copy the code at the end of the install that starts with "kubeadm join" and store it. 
Looks like this:
kubeadm join 172.31.47.110:6443 --token duc2j0.km6tuy0gbvgrcutx --discovery-token-ca-cert-hash sha256:180108785dfe178dd74bc22243d210e72ab4cf656ea32a88f584c63a673e8acb
 
#run the following
```
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```
 
#Check if kubernetes is up
```
kubectl get nodes
```
 
#Add flannel  
```
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/v0.9.1/Documentation/kube-flannel.yml
```
 
At this point you should see master acting as a node. Go ahead and create more nodes and check if nodes are communicating with master.


INSTALLING NODES
 
Run the commands from step 1 & 2
 
#Next step is to use the token you stored. 
```
kubeadm join 172.31.47.110:6443 --token duc2j0.km6tuy0gbvgrcutx --discovery-token-ca-cert-hash sha256:180108785dfe178dd74bc22243d210e72ab4cf656ea32a88f584c63a673e8acb
```
 
Please note you should use your own token given to you and not this. 

#Then check on master
```
kubectl get nodes
```