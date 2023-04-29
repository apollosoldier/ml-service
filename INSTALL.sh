#!/bin/bash

# Update the package manager
sudo apt update

# Install essential packages
sudo apt install -y curl wget gnupg2 software-properties-common

# Install MicroK8s
snap install microk8s --classic

# Add current user to the MicroK8s group
sudo usermod -a -G microk8s $USER

# Configure kubectl to use MicroK8s cluster
microk8s config > ~/.kube/config

# Enable necessary add-ons
microk8s enable dns dashboard storage gpu

# Install Minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && chmod +x minikube && sudo mv minikube /usr/local/bin/

# Install Docker
sudo apt-get install -y docker.io

# Add current user to the Docker group
sudo usermod -a -G docker $USER

# Install Git
sudo apt-get install -y git

# Print message indicating installation is complete
echo "MicroK8s, Minikube, Docker, Git, and essential packages have been installed and configured."
