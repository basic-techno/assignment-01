#!/bin/bash

###installing kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client

#installing docker
sudo apt-get update -y &&  sudo apt-get install -y docker.io
sudo docker version
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

#installing minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
&& chmod +x minikube \
&& sudo mv minikube /usr/local/bin/

#Start minikube
sudo -i
minikube start --driver=docker
              
#Check the minikube using kubectl
kubectl get pods

#Install OpenJDK
sudo apt-get install -y openjdk-8-jdk
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
echo $JAVA_HOME
export PATH=$PATH:$JAVA_HOME/bin

#Installing GIT
sudo apt update
sudo apt install git


#Installing Jenkins
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install -y jenkins

#Starting Jenkins
sudo systemctl start jenkins