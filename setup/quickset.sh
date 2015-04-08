sudo rm /etc/mac
cp /home/linaro/bitcoin-box/.hdd/*.sh /home/linaro
sudo chown -R linaro:linaro /home/linaro
chmod 755 /home/linaro/*.sh

#set serial number
echo "Enter device serial number:"
read serial
echo $serial > deviceid
echo $serial > /var/www/html/serial


#disable screensaver becuase it uses too much CPU
rm /home/linaro/.config/lxsession/LXDE/autostart
echo "@lxpanel --profile LXDE" >> /home/linaro/.config/lxsession/LXDE/autostart
echo "@pcmanfm --desktop --profile LXDE" >> /home/linaro/.config/lxsession/LXDE/autostart
echo "@/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1" >> /home/linaro/.config/lxsession/LXDE/autostart

#dd line below not needed if hdd is pre-imaged with swapfile
echo "seting up swap"
dd if=/dev/zero of=/home/swapfile bs=1024 count=1048576
sudo chown root:root /home/swapfile
sudo chmod 0600 /home/swapfile
sudo mkswap /home/swapfile
sudo swapon  /home/swapfile
