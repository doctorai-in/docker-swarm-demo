# Install Docker
echo **********INSTALLING DOCKER IMAGE************* 

sudo apt-get -y update

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository -y \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get -y update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io

echo **********INSTALLATION FINISHED*************

echo **********setup username***************
read -p 'NodeName: ' user
sudo adduser $user --disabled-password
sudo passwd $user
sudo usermod -aG sudo $user
sudo su - $user
mkdir .ssh
chmod 700 .ssh
touch .ssh/authorized_keys
chmod 600 .ssh/authorized_keys
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCAzatTc18t5WZlyaZ5M37ANq4xVOHVfY8bXZImduJvWMarCOVOxATlVx6FMpHgX4w4viCVHopYVGN2VmaLIAkvb+kQWq17I3nBaO0L2Npxw9vbEDbmiD83ZziBAtDBntGUzV8Wh7VFwhgmAGdHYg6bGmRV0vDjF0J1VguSKc3DfeBztxza0F06m+ehlsZYgvHzMqfpbbOse2yiQraNiWbC+bg3hVI2vikQ87npmOavBWvGjvAPct9TL3+kkgJUA6IJ6aJAh2JxAt2+KHt3kJfbIn6jhRXysKLo897wHVWXUaqBhfMgfV6HvvGJR8O+3VVr7JTWYpcgRJAr' >>~/.ssh/authorized_keys

echo ************SETTING UP DOCKER AS NON-ROOT*************
sudo usermod -aG docker $USER
newgrp docker
