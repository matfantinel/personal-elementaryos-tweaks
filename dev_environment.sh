#!/bin/bash

#Setup git
echo "----------------------------------- Installing git"
sudo apt install git -y

git config --global user.name "Matheus Fantinel"
git config --global user.email "matfantinel@gmail.com"

#Install nodeJS
echo "----------------------------------- Installing nodeJS"
nvm install node

#Install snap
echo "----------------------------------- Installing snap"
sudo apt install snapd -y

#Install dotnet-core SDK version 2.2 (needed for project I work on)
echo "----------------------------------- Installing .NET Core SDK"
sudo snap install dotnet-sdk --channel=2.1/stable --classic

sudo snap alias dotnet-sdk.dotnet dotnet
sudo ln -sv /snap/dotnet-sdk/current/dotnet /usr/local/bin/dotnet

#Install MongoDB
echo "----------------------------------- Installing MongoDB"
wget https://repo.mongodb.org/apt/ubuntu/dists/bionic/mongodb-org/4.2/multiverse/binary-amd64/mongodb-org-server_4.2.3_amd64.deb
sudo dpkg -i mongodb-org-server_4.2.3_amd64.deb

#Set ownership of MongoDB data folder
sudo mkdir -p /data/db/
sudo chown `id -u` /data/db

#Install Angular CLI
npm i -g @angular/cli --silent
