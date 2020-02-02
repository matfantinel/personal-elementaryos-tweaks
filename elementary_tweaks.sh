#!/bin/bash

#Enable ppas
echo "----------------------------------- Enabling ppas..."
sudo apt install software-properties-common -y

#Install system76-power package for better power management
echo "----------------------------------- Installing system76-power..."
sudo apt-add-repository -y ppa:system76-dev/stable
sudo apt update
sudo apt install system76-power -y


#Install elementary-tweaks
echo "----------------------------------- Installing elementary-tweaks..."
sudo add-apt-repository ppa:philip.scott/elementary-tweaks -y
sudo apt install elementary-tweaks -y


#Enable indicators
echo "----------------------------------- Enabling app indicators..."
mkdir -p ~/.config/autostart
cp /etc/xdg/autostart/indicator-application.desktop ~/.config/autostart/
sed -i 's/^OnlyShowIn.*/OnlyShowIn=Unity;GNOME;Pantheon;/' ~/.config/autostart/indicator-application.desktop
wget http://ppa.launchpad.net/elementary-os/stable/ubuntu/pool/main/w/wingpanel-indicator-ayatana/wingpanel-indicator-ayatana_2.0.3+r27+pkg17~ubuntu0.4.1.1_amd64.deb
sudo dpkg -i wingpanel-indicator-ayatana_2.0.3+r27+pkg17~ubuntu0.4.1.1_amd64.deb

#Remove duplicated network indicator
killall nm-applet
sudo rm /etc/xdg/autostart/nm-applet.desktop
