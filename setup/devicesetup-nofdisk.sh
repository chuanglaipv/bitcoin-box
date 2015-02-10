#prepares the device but does not format the HDD
#intended for when you have a pre-imaged HDD with blockchain installed
#prep OS
sudo apt-get update
#install nano for editing (and ntp to set the system clock - may not be needed for 14.12)
sudo apt-get install -y nano
#sudo apt-get install -y ntp
#sudo service ntp restart
sudo apt-get -y upgrade
#rsync for database backup sync
sudo apt-get install -y rsync
#allow device to generate a new mac
sudo rm /etc/mac
#prep btc script
sudo chmod 755 btcsetup.sh
#change host name
sudo hostname btc
sudo rm /etc/hostname
sudo echo "btc" >> /etc/hostname
sudo rm /etc/hosts
sudo cp /home/linaro/bitcoinbox/setup/hosts /etc/

#disable screensaver becuase it uses too much CPU
rm /home/linaro/.config/lxsession/LXDE/autostart
echo "@lxpanel --profile LXDE" >> /home/linaro/.config/lxsession/LXDE/autostart
echo "@pcmanfm --desktop --profile LXDE" >> /home/linaro/.config/lxsession/LXDE/autostart
echo "@/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1" >> /home/linaro/.config/lxsession/LXDE/autostart

#add line to /etc/fstab to mount hdd
echo "mount HDD and setup fstab automount"
sudo echo '/dev/sda1   /home/linaro/hdd   ext4   defaults  0  2' >> /etc/fstab
mkdir /home/linaro/hdd
sudo mount -a
sudo chown linaro:linaro /home/linaro/hdd

#swapfile setup
echo "1GB swapfile setup on HDD"
#dd line below not needed if hdd is pre-imaged with swapfile
#dd if=/dev/zero of=/home/linaro/hdd/swapfile bs=1024 count=1048576
sudo chown root:root /home/linaro/hdd/swapfile
sudo chmod 0600 /home/linaro/hdd/swapfile
sudo mkswap /home/linaro/hdd/swapfile
sudo swapon  /home/linaro/hdd/swapfile
sudo echo '/home/linaro/hdd/swapfile   none   swap  sw   0  0' >> /etc/fstab