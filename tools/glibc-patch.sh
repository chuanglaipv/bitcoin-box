#upgrades the OS to fix glibc dns vulnerability of 2/2016
#run as sudo

sudo echo "deb http://ports.ubuntu.com/ubuntu-ports/ trusty-security main universe" >> /etc/apt/sources.list
sudo echo "deb-src http://ports.ubuntu.com/ubuntu-ports/ trusty-security main universe" >> /etc/apt/sources.list
 
#sudo echo "deb http://ppa.launchpad.net/ubuntu-security-proposed/ppa/ubuntu trusty main" >> /etc/apt/sources.list
#sudo echo "deb-src http://ppa.launchpad.net/ubuntu-security-proposed/ppa/ubuntu trusty main" >> /etc/apt/sources.list
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com ADCE2AF3A4E0014F

sudo sed -i '/wiimu/d' /etc/apt/sources.list

sudo apt-get update

sudo apt-get install -y libc-dev-bin libc6 libc6-armel libc6-dev

sudo dpkg -l libc6 libc6-dev libc6-armel libc-dev-bin

#it should show version 2.19-0ubuntu6.7

#Now we should remove the staging PPS so it doesnt pull down any unstable updates

#sudo sed -i '/ubuntu-security-proposed/d' /etc/apt/sources.list

sudo apt-get update
echo "patch complete"
