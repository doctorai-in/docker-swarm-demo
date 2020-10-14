cd ~
mkdir .ssh
chmod 700 .ssh
touch .ssh/authorized_keys
chmod 600 .ssh/authorized_keys
cp -f /home/ubuntu/docker-swarm-demo/authorized_keys .ssh/
chmod 600 .ssh/authorized_keys
git clone https://github.com/docker/example-voting-app.git
