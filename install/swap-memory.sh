sudo dd if=/dev/zero of=/swapfile bs=128M count=32
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo swapon -s
sudo su -c "echo /swapfile swap swap defaults 0 0 >> /etc/fstab"
