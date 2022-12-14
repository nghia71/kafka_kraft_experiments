# !/bin/sh

# Uninstall old versions
sudo apt remove docker docker-engine docker.io containerd runc

# Set up the repository
sudo apt update -y
sudo apt install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y
sudo mkdir -p /etc/apt/keyrings
curl -fsSL -C - https://download.docker.com/linux/ubuntu/gpg | sudo gpg --batch --yes --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
sudo apt update -y
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

# Test
sudo docker run hello-world

# Post-installation
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world