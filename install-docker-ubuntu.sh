#!/bin/bash
# Remove old docker versions
sudo apt-get remove docker docker-engine docker.io containerd runc

#Setup the repository
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Verify fingerprints
sudo apt-key fingerprint 0EBFCD88

# Add the repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Install Docket Engine
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

# Enable non-root users to run Docker
sudo usermod -aG docker $(whoami)

# Verify the installation and run hello-world
sudo docker run hello-world
