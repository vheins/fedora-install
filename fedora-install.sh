##Install Snap Store
sudo dnf install snapd
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install snap-store


##Install Chrome
sudo dnf install wget -y
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo dnf localinstall google-chrome-stable_current_x86_64.rpm -y

##Install VS Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf -y sinstall code

##Install Utilities
sudo dnf install -y rclone htop nethogs

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


