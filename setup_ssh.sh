cd ~
mkdir .ssh
chmod 700 .ssh
touch .ssh/authorized_keys
chmod 600 .ssh/authorized_keys
cp -f authorized_keys .ssh/
chmod 600 .ssh/authorized_keys
