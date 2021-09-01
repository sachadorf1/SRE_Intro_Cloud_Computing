!#/bin/bash

#THIS IS A PROVSIONING SCRIPT

#Sets up machine (ensures all things work)
sudo apt-get update -y
sudo apt-get upgrade -y

#Install nginx package
sudo apt-get install nginx -y

#Install and setup npm and nodejs
sudo apt-get install python-software-properties -y
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs -y
 #Change directories
cd /home/ubuntu/app
sudo npm install pm2 -y
sudo npm install
sudo rm /etc/nginx/sites-available/default
sudo ln -s /home/ubuntu/config_files/default /etc/nginx/sites-available/default
sudo nginx -t
sudo systemctl restart nginx
echo 'export DB_HOST=192.168.10.150:27017/posts/' >> /etc/environment
source /etc/environment
node seeds/seed.js
npm start