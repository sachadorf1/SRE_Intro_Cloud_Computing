# SRE_introduction_cloud_computing_AWS 
testing
- [SRE_introduction_cloud_computing_AWS](#sre_introduction_cloud_computing_aws)
- [Introduction to Cloud Computing](#introduction-to-cloud-computing)
    - [Key Advantages](#key-advantages)
    - [What is the role of an SRE?](#what-is-the-role-of-an-sre)
  - [What is Cloud Computing and the benefits of using it?](#what-is-cloud-computing-and-the-benefits-of-using-it)
  - [What is AWS and benefits of using it?](#what-is-aws-and-benefits-of-using-it)
  - [What is SDLC and what are the stages of it?](#what-is-sdlc-and-what-are-the-stages-of-it)
  - [What are the risk levels at each stage of SDLC?](#what-are-the-risk-levels-at-each-stage-of-sdlc)
  - [What is On Prem, Cloud, Hybrid Cloud and Multi Cloud - Pros and cons of each model](#what-is-on-prem-cloud-hybrid-cloud-and-multi-cloud---pros-and-cons-of-each-model)
    - [On premises](#on-premises)
    - [Cloud](#cloud)
    - [Hybrid Cloud](#hybrid-cloud)
    - [Multi Cloud](#multi-cloud)
    - [Diagrams for each case with real life example or use cases (needs editing)](#diagrams-for-each-case-with-real-life-example-or-use-cases-needs-editing)
- [Vagrant](#vagrant)
  - [Task 1: Configure reverse proxy first without the db machine](#task-1-configure-reverse-proxy-first-without-the-db-machine)
  - [Task 2: Configure Reverse Proxy](#task-2-configure-reverse-proxy)
  - [Task 3: Connecting the database to the app](#task-3-connecting-the-database-to-the-app)
  - [Task 4: Automation](#task-4-automation)
# Introduction to Cloud Computing

### Key Advantages
- Ease of use
- Flexibility
- Robustness
- Cost

### What is the role of an SRE?

They help increase the reliability and performance of the site. They are more on the operations side, whilst also understanding the development side.
They automate tasks and monitor and improve the efficiency of systems.

## What is Cloud Computing and the benefits of using it?

Instead of buying and spending money maintaining your own physical data centres, you can get access to these services on an as-need basis. This saves a lot of money and is more flexible/adaptable to change.

## What is AWS and benefits of using it?

It provides online cloud computing platforms on a pay-as-you-go basis, including infrastructure (storage and databases) and services such as Machine Learning and Analytics.
It is highly scalable and reliable, easy to use, flexible and cost effective as you only pay for what you use.


## What is SDLC and what are the stages of it?

- Software Development Life Cycle
- A methodology that defines different stages that bring a software development project from its initial idea to its deployment and maintenance
- It exists to improve the quality of software and the development process

1. Planning
2. Analysis
3. Design
4. Development/Implementation
5. Testing and Integration
6. Maintenance

![SDLC_diagram](https://user-images.githubusercontent.com/88316764/130941816-8661e9d5-19de-4b4e-a0d4-c24e124c9409.png)

## What are the risk levels at each stage of SDLC?

1. Planning - Low
2. Analysis - Low
3. Design - Medium
4. Implementation - High
5. Testing and Integration - High
6. Maintenance - High

## What is On Prem, Cloud, Hybrid Cloud and Multi Cloud - Pros and cons of each model

### On premises
- On premises is where you buy and maintain your own data centers
- Pros:
    - You have full control over your applications/servers
- Cons:
    - Expensive to maintain
    - Difficult and expensive to scale
### Cloud
- Cloud is globally available and you can access services on an as-need basis, more scalable and cost-effective
- Instead of you paying to maintain your own data centers, a third-party (cloud provider) does that for you
- Pros
    - Cost effective, you only pay for what you use
    - Minimum management and easy to use
    - Scalable with your business needs
    - Reliable and you have a huge scale of resources and storage available
- Cons
    - Downtime, cloud requires high internet speed and good bandwidth
    - Limited flexibility as you are not in control of the infrastructure

![image](https://user-images.githubusercontent.com/88316764/130954738-3eb3466a-a7a5-47ef-b47b-5112ecec04c8.png)

![image](https://user-images.githubusercontent.com/88316764/130954613-60354958-aed4-46ea-8eb9-28f79c0a83f9.png)

### Hybrid Cloud
- Mixed computing, storage and services environment made up of on-prem infrastructure, private cloud and public cloud
- Some of your data (e.g. sensitive information) is stored privately and some is stored publicly using Cloud services
- Banks use this so they can have control of sensitive data on prem (e.g. personal details) but also save money by moving low risk data (e.g. information on their website) to the cloud
- Pros
    - Flexibility as you can decide what data you want to have on prem and what data you want to have on the cloud, so you can choose a solution that 
    - Faster software performance, enables organisations to move faster to DevOps
- Cons
    - Difficult to implement and maintain
    - Can be more expensive than public cloud
    - Compatibility and data integration - Need to understand what files are compatible or how to deal with that

### Multi Cloud
- Multi cloud involves the use of more than one public cloud (e.g. AWS and Azure)
- Pros 
    - Companies can avoid vendor lock-in as they don't have everything on one provider, also encourages competitive prices
    - Risk reduction - If one cloud goes down, you can rely on your other providers to keep your information secure

### Diagrams for each case with real life example or use cases (needs editing)

![image](https://user-images.githubusercontent.com/88316764/130951629-5cc3a8fb-2c7e-434b-bc2a-59c2f8c3ba65.png)

![image](https://user-images.githubusercontent.com/88316764/130951433-d79cffd9-0fcd-4d97-adda-c1572ef9389b.png)




![image](https://user-images.githubusercontent.com/88316764/130951879-1c6a854b-c759-4a76-8eeb-edd9edeaf7ba.png)





# Vagrant


![Screenshot (65)](https://user-images.githubusercontent.com/88316764/130981031-7b3d6d2f-5255-4590-a343-e6f3aad63fc9.png)

## Task 1: Configure reverse proxy first without the db machine
The app should load without 3000 port instead of nginx default page

- Create a provision.sh file on localhost:
- Go into the provision file

`nano provision.sh`
```
!#/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install nginx -y
```
- Go into the Vagrantfile:

`nano Vagrantfile`
```
Vagrant.configure("2") do |config|

    config.vm.box = "ubuntu/xenial64"
        
    config.vm.network "private_network", ip: "192.168.10.100"
        
    config.vm.provision "shell", path: "provision.sh"

    end
```

- Go into virtual machine:

`vagrant up`

`vagrant ssh`

- Change directory into home/ubuntu:

`cd /home/ubuntu`


Install dependencies:
```
sudo apt-get install npm -y

sudo apt-get install python-software-properties -y

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

sudo apt-get install nodejs -y
```
Go into the app directory:

`cd app`
```
sudo npm install pm2 -g

npm install

npm start
```
The app should run on 192.168.10.100:3000

## Task 2: Configure Reverse Proxy

- Go into the default file

`sudo nano /etc/nginx/sites-available/default`

Add the following to the server{}:
```
location / {
        proxy_pass http://localhost:3000;      
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade'; 
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;      
    }
```
- Then enter the following in the terminal:
```
sudo nginx -t

sudo systemctl restart nginx

npm start
```
The app should run on 192.168.10.100

## Task 3: Connecting the database to the app

- Add environment variable
```
echo DB_HOST=192.168.10.150:27017/posts >> ~/.bashrc

source ~/.bashrc</code>
```
- Exit the vm

- Vagrant ssh into the database

`vagrant ssh db`

## Task 4: Automation

Create a VagrantFile with the following inside:

    Vagrant.configure("2") do |config|

        config.vm.define "db" do |db|
            db.vm.box = "ubuntu/xenial64"
            db.vm.network "private_network", ip: "192.168.10.150"
            db.vm.synced_folder "config_files", "/home/ubuntu/config_files"
            db.vm.provision "shell", path: "db/provision_db.sh"
        end
        config.vm.define "app" do |app|
            app.vm.box = "ubuntu/xenial64"
            app.vm.network "private_network", ip: "192.168.10.100"
            app.vm.synced_folder "app", "/home/ubuntu/app"
            app.vm.synced_folder "config_files", "/home/ubuntu/config_files"
            app.vm.provision "shell", path: "provision.sh"
        end
        
    end

Create a provision.sh with the following inside:
```
!#/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install nginx -y
sudo apt-get install python-software-properties -y
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs -y
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
```
Create a provision_db.sh with the following inside:
```
!#/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
sudo apt-get update -y
sudo apt-get install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod
sudo rm /etc/mongod.conf
sudo ln -s /home/ubuntu/config_files/mongod.conf /etc/mongod.conf
sudo systemctl restart mongod
```
- Create a directory 'config_files'
- Within 'config_files', create a 'default' file with the following inside:
```
server {
    listen 80;
    server_name _;
    location / {
        proxy_pass http://lhost:3000;      
        proxy_http_version 1.1;
        proxy_set_header Upgrade p_upgrade;
        proxy_set_header Connection rade'; 
        proxy_set_header Host $host;
        proxy_cache_bypass p_upgrade;      
    }
}
```
- Within 'config_files', create a 'mongod.conf' file with the following inside:
```
# mongod.conf
# for documentation of all options, e:
#   http://docs.mongodb.org/manual/erence/configuration-options/
# Where and how to store data.
storage:
dbPath: /var/lib/mongodb
journal:
    enabled: true
#  engine:
#  mmapv1:
#  wiredTiger:
# where to write logging data.
systemLog:
destination: file
logAppend: true
path: /var/log/mongodb/mongod.log
# network interfaces
net:
port: 27017
bindIp: 0.0.0.0
# how the process runs
processManagement:
timeZoneInfo: /usr/share/zoneinfo
#security:
#operationProfiling:
#replication:
#sharding:
## Enterprise-Only Options:
#auditLog:
#snmp:
```
- When you vagrant up, you should be able to see a page of latin words on 192.168.10.100/posts