#!/usr/bin/env bash
###################################################
###################################################
##########      Author: Adrian D. Moseley
##########      E-mail: adrian.moseley@gmail.com
##########      twitter: @adrianmoseley
###################################################
###################################################
##	Other configuration items not handled by script:
##	
##	- How to Change the GDM Background on Ubuntu
##	    wget github.com/thiggy01/ubuntu-20.04-change-gdm-background/raw/master/ubuntu-20.04-change-gdm-background
##	
##	- AppImageLauncher
##	    https://github.com/TheAssassin/AppImageLauncher/releases
##	
##	- AppImage Apps    
##	    balenaEtcher
##	    ClipGrab
##	    OpenShot
##	    RawTherapee
##	    okular
##	    flightlight
##	
##	- Horizon View Client
##	    https://www.vmware.com/go/viewclients
##	
##	- Configure and Install RetroPi Game emulator
##	    https://markontech.com/linux/how-to-install-retropie-on-ubuntu-tutorial/
##	
##	- Configure Xbox One S Controller
##	    https://www.youtube.com/watch?v=bAI4vnlQhPg
##	    sudo apt install sysfsutils
##	    sudo nano /etc/sysfs.conf
##	    place the following at the end of the file. "/module/bluetooth/parameters/disable_ertm=1"
##	
##	- Themes
##	    https://itsubuntu.com/11-best-ubuntu-20-04-lts-themes-in-2020/
##	
##	- Exodus.io
##	    https://www.exodus.io/
##	
##	- Daedalus
##	    https://daedaluswallet.io/
##	
##	- VScode
##	    https://code.visualstudio.com/Download
###################################################
###################################################

#Add Ubuntu Repo
echo "Adding the Ubuntu universe repo:"
sudo add-apt-repository universe
clear

#add canocial partners
echo "Adding Canonical Partners"
sudo add-apt-repository "deb http://archive.canonical.com/ubuntu $(lsb_release -sc) partner"
clear

#Add ODS Studio PPA
echo "Adding the ODS Studio PPA Repo:"
sudo add-apt-repository ppa:obsproject/obs-studio
clear

#AppImageLauncher to manage appimage Based Apps
#https://github.com/TheAssassin/AppImageLauncher
echo "Adding the AppImageLauncher repo"
sudo add-apt-repository ppa:appimagelauncher-team/stable
clear

#Add ConkyManager not working
#sudo add-apt-repository ppa:linuxmint-tr/araclar

#Add Brave Browser Repo
echo "Install curl and Brave Browser repo:"
sudo apt install curl
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update && sudo apt upgrade -y
clear

#Install Apps
echo "Install all favorite apps"
sudo apt install brave-browser apt-transport-https gnupg synaptic htop screenfetch synapse flameshot stacer snap peek  obs-studio python3 python3-pip golang  celluloid speedcrunch conky-all xscreensaver xscreensaver-gl-extra xscreensaver-data-extra appimagelauncher openshot glances okular simple-scan unity-tweak-tool gdebi pavucontrol gimp gparted preload gnome-tweak-tool bleachbit pdfsam openssh-server sysfsutils appimagelauncher git -y


#Gnome Extensions
sudo apt install $(apt search gnome-shell-extension | grep ^gnome | cut -d / -f1) -y

#Add Snap based programs
sudo snap install bitcoin-core bashtop cointop cryptoinfo snap-store
sudo snap install slack --classic

#Configure Openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh

cd ~
mkdir Development
cd Development
git clone https://github.com/admoseley/NewUbuntuSetup.git
#clipgrab - Not working, need new ppa
#sudo add-apt-repository ppa:clipgrab-team/ppa
#sudo apt-get update && sudo apt-get upgrade
#sudo apt-get install clipgrab
