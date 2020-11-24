#!/usr/bin/bash
```
Other configuration items not handled by script:

- How to Change the GDM Background on Ubuntu
    wget github.com/thiggy01/ubuntu-20.04-change-gdm-background/raw/master/ubuntu-20.04-change-gdm-background

- AppImageLauncher
    https://github.com/TheAssassin/AppImageLauncher/releases

- AppImage Apps    
    balenaEtcher
    ClipGrab
    OpenShot
    RawTherapee
    okular
    flightlight

- Horizon View Client
    https://www.vmware.com/go/viewclients

- Configure Xbox One S Controller
    https://www.youtube.com/watch?v=bAI4vnlQhPg
    sudo apt install sysfsutils
    sudo nano /etc/sysfs.conf
    place the following at the end of the file. "/module/bluetooth/parameters/disable_ertm=1"

- Themes
    https://itsubuntu.com/11-best-ubuntu-20-04-lts-themes-in-2020/

- Exodus.io
    https://www.exodus.io/

- Daedalus
    https://daedaluswallet.io/

- VScode
    https://code.visualstudio.com/Download
```

#Add ODS Studio PPA
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt install curl -y

#Add Brave Browser Repo
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update

#Install Apps
sudo apt install brave-browser apt-transport-https gnupg synaptic conky conkymanager htop screenfetch synapse flameshot stacer snap peek  obs-studio python3 python3-pip golang  celluloid halo speedcrunch conky-all xscreensaver xscreensaver-gl-extra xscreensaver-data-extra curl -y
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

#clipgrab
sudo add-apt-repository ppa:clipgrab-team/ppa
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install clipgrab

#AppImageLauncher to manage Snap Based Apps
#https://github.com/TheAssassin/AppImageLauncher
sudo add-apt-repository ppa:appimagelauncher-team/stable
sudo apt-get update
sudo apt install AppImageLauncher -y