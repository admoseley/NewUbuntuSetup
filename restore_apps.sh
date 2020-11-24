#!/usr/bin/bash
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt install curl -y
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser apt-transport-https curl gnupg synaptic conky conkymanager htop screenfetch synapse flameshot stacer snap peek  obs-studio python3 python3-pip golang  celluloid halo speedcrunch conky-all xscreensaver xscreensaver-gl-extra xscreensaver-data-extra -y
sudo apt install openshot glances okular simple-scan unity-tweak-tool gdebi pavucontrol gimp gparted preload gnome-tweak-toolbleachbit pdfsam openssh-server sysfsutils -y

#Configure Openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh

#Gnome Extensions
sudo add-apt-repository universe

sudo apt install $(apt search gnome-shell-extension | grep ^gnome | cut -d / -f1)

#Add Snap based programs
sudo snap install bitcoin-core bashtop cointop cryptoinfo snap-store
sudo snap install slack --classic

#Themes
#https://itsubuntu.com/11-best-ubuntu-20-04-lts-themes-in-2020/

#clipgrab
sudo add-apt-repository ppa:clipgrab-team/ppa
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install clipgrab

#AppImageLauncher to manage Snap Based Apps
#https://github.com/TheAssassin/AppImageLauncher
sudo add-apt-repository ppa:appimagelauncher-team/stable
sudo apt-get update




#wget github.com/thiggy01/ubuntu-20.04-change-gdm-background/raw/master/ubuntu-20.04-change-gdm-background

#https://github.com/TheAssassin/AppImageLauncher/releases

'''
Install other items 
#Horizon View
https://my.vmware.com/en/web/vmware/downloads/info/slug/desktop_end_user_computing/vmware_horizon_clients/2006
https://github.com/thiggy01/ubuntu-20.04-change-gdm-background

exodus.io
daedalus
vscode
https://code.visualstudio.com/Download


#Configure Xbox Controller
https://www.youtube.com/watch?v=bAI4vnlQhPg
sudo apt install sysfsutils
sudo nano /etc/sysfs.conf
place the following at the end of the file. "/module/bluetooth/parameters/disable_ertm=1"

#Google search to add these AppImage images.
balenaEtcher
ClipGrab
OpenShot
RawTherapee
okular
flightlight
'''
