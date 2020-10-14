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
sudo mkdir /home/$user/.ssh
sudo chmod 700 /home/$user/.ssh
sudo touch /home/$user/.ssh/authorized_keys
sudo chmod 600 /home/$user/.ssh/authorized_keys
sudo cp -f authorized_keys /home/$user/.ssh/authorized_keys
echo ************SETTING UP DOCKER AS NON-ROOT*************
sudo usermod -aG docker $user
sudo su - $user
