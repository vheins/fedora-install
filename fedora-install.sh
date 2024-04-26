
##Install docker

#Uninstall old versions
sudo dnf remove -y docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-selinux docker-engine-selinux docker-engine

#Set up the repository
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

#Install Docker Engine
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

#Linux post-installation steps for Docker Engine
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

#Fix Permission Problem
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R

#Configure Docker to start on boot with systemd
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
