sudo yum update -y

# install dependencies

sudo yum install -y conntrack curl

# install docker

- sudo amazon-linux-extras install docker -y
- sudo service docker start
- sudo usermod -a -G docker ec2-user

# install kubectl
- sudo curl --silent --location -o /usr/local/bin/kubectl \
    https://storage.googleapis.com/kubernetes-release/release/$(curl --silent --location \
    https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
    
- sudo chmod +x /usr/local/bin/kubectl

# install & start minikube
- curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
- sudo install minikube-linux-amd64 /usr/local/bin/minikube
- minikube start --driver=docker
- kubectl version --short
- minikube status

# EKS Insatallation
You can follow same procedure in the official AWS document Getting started with Amazon EKS – eksctl installation
https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html

