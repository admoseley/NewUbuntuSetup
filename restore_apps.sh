#!/usr/bin/env bash
###################################################
###################################################
##########      Author: Adrian D. Moseley
##########      E-mail: adrian.moseley@gmail.com
##########      twitter: @adrianmoseley
###################################################
###################################################
##  Install and configure Ubuntu 20.10
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
##                clipgrab - Not working, need new ppa
##                sudo add-apt-repository ppa:clipgrab-team/ppa
##                sudo apt-get update && sudo apt-get upgrade
##                sudo apt-get install clipgrab
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
##
##  -Dropbox
##      echo "deb [arch=i386,amd64] http://linux.dropbox.com/ubuntu $(lsb_release -sc) main"|sudo tee /etc/apt/sources.list.d/dropbox.list
##      sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E
##
##
##  -MacOS Theme
##      https://www.omgubuntu.co.uk/2017/03/make-ubuntu-look-like-mac-5-steps
##
###################################################
###################################################

#Add Ubuntu Repo
echo "$(tput setaf 1)$(tput setab 7)Adding the Ubuntu universe repo...$(tput sgr 0)"
sudo add-apt-repository universe
clear

#add canocial partners
echo "$(tput setaf 1)$(tput setab 7)Adding Canonical Partners...$(tput sgr 0)"
sudo add-apt-repository "deb http://archive.canonical.com/ubuntu $(lsb_release -sc) partner"
clear

#Add ODS Studio PPA
echo "$(tput setaf 1)$(tput setab 7)Adding the ODS Studio PPA Repo...$(tput sgr 0)"
sudo add-apt-repository ppa:obsproject/obs-studio
clear

#Add Microsoft VS Code
#wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
#sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
#sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

#AppImageLauncher to manage appimage Based Apps
#https://github.com/TheAssassin/AppImageLauncher
echo "$(tput setaf 1)$(tput setab 7)Adding the AppImageLauncher repo...$(tput sgr 0)"
sudo add-apt-repository ppa:appimagelauncher-team/stable
clear

#Add ConkyManager not working
#sudo add-apt-repository ppa:linuxmint-tr/araclar

#Add Brave Browser Repo
echo "$(tput setaf 1)$(tput setab 7)Install curl and Brave Browser repo...$(tput sgr 0)"
sudo apt install curl
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update && sudo apt upgrade -y
clear


#Add Google Chrome
echo "$(tput setaf 1)$(tput setab 7)Install Google Chrome...$(tput sgr 0)"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
clear

#Install Apps
echo "$(tput setaf 1)$(tput setab 7)Install all favorite apps...$(tput sgr 0)"
sudo apt install brave-browser apt-transport-https gnupg synaptic htop screenfetch synapse flameshot stacer snap peek  obs-studio python3 python3-pip golang  celluloid speedcrunch conky-all xscreensaver xscreensaver-gl-extra xscreensaver-data-extra appimagelauncher openshot glances okular simple-scan unity-tweak-tool gdebi pavucontrol gimp gparted preload gnome-tweak-tool bleachbit pdfsam openssh-server sysfsutils appimagelauncher git yakuake timeshift libxml2-utils -y
clear

#Gnome Extensions
echo "$(tput setaf 1)$(tput setab 7)Install Gnome Extensions...$(tput sgr 0)"
sudo apt install $(apt search gnome-shell-extension | grep ^gnome | cut -d / -f1) -y
clear

#Add Snap based programs
echo "$(tput setaf 1)$(tput setab 7)Install Snap Based Apps...$(tput sgr 0)"
sudo snap install bitcoin-core bashtop cointop cryptoinfo snap-store
sudo snap install slack --classic
clear

#Install Dropbox
echo "$(tput setaf 1)$(tput setab 7)Install Dropbox...$(tput sgr 0)"
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd

#Configure Openssh-server
echo "$(tput setaf 1)$(tput setab 7)Enable SSH Server...$(tput sgr 0)"
sudo systemctl enable ssh
sudo systemctl start ssh
clear

echo "$(tput setaf 1)$(tput setab 7)Download Git Repo for restore_app.sh..$(tput sgr 0)"
echo "Use: git clone https://github.com/admoseley/NewUbuntuSetup.git"

#Links to address fix with Horizon View Client
# https://www.reddit.com/r/vmware/comments/etb2r4/failures_installing_vmware_horizon_client_for/
sudo ln -s /usr/lib/x86_64-linux-gnu/libgstreamer-1.0.so.0 /usr/lib/x86_64-linux-gnu/libgstreamer-0.10.so.0
sudo ln -s /usr/lib/x86_64-linux-gnu/libgstapp-1.0.so.0 /usr/lib/x86_64-linux-gnu/libgstapp-0.10.so.0
sudo ln -s /usr/lib/x86_64-linux-gnu/libgstbase-1.0.so.0 /usr/lib/x86_64-linux-gnu/libgstbase-0.10.so.0