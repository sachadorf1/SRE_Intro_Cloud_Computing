# SRE_introduction_cloud_computing_AWS 
## Cloud Computing with AWS
### SDLC stages
#### Risk factors with SDLC stages
##### Monitoring

### Key Advantages:
- Ease of use
- Flexibility
- Robustness
- Cost

**SRE introduction**
- What is the role of SRE?

They help increase the reliability and performance of the site. They are more on the operations side, whilst also understanding the development side.
They automate tasks and monitor and improve the efficiency of systems.


**Cloud Computing**
- What is Cloud Computing and the benefits of using it?

Instead of buying and spending money maintaining your own physical data centres, you can get access to these services on an as-need basis. This saves a lot of money and is more flexible/adaptable to change.

**What is Amazon Web Services (AWS)**
- What is AWS and benefits of using it

It provides online cloud computing platforms on a pay-as-you-go basis, including infrastructure (storage and databases) and services such as Machine Learning and Analytics.
It is highly scalable and reliable, easy to use, flexible and cost effective as you only pay for what you use.

**What is SDLS and stages of SDLC**
- What is SDLC and what are the stages of it

Software Development Life Cycle

![SDLC_diagram](https://user-images.githubusercontent.com/88316764/130941816-8661e9d5-19de-4b4e-a0d4-c24e124c9409.png)

**What are the Risk level at each stage of SDLC?**
- Low
- Medium
- High

complete it by 11 and share you github repo once completed
11-11:15

-What is on prem, cloud and Hybrid cloud and multi cloud

On premises is where you buy and maintain the data centers
Cloud is globally available and you can access services on an as-need basis, more scalable and cost-effective.

Hybrid Cloud is where some of your data (e.g. sensitive information) is stored privately and some is stored publicly using Cloud services
Hybrid cloud is a combination of public and private clouds

Multi cloud involves the use of more than one public cloud

-add a diagram for each case with real life example or use cases

![image](https://user-images.githubusercontent.com/88316764/130954738-3eb3466a-a7a5-47ef-b47b-5112ecec04c8.png)

![image](https://user-images.githubusercontent.com/88316764/130954613-60354958-aed4-46ea-8eb9-28f79c0a83f9.png)

![image](https://user-images.githubusercontent.com/88316764/130951629-5cc3a8fb-2c7e-434b-bc2a-59c2f8c3ba65.png)

![image](https://user-images.githubusercontent.com/88316764/130951433-d79cffd9-0fcd-4d97-adda-c1572ef9389b.png)



-pros and cons of each model

![image](https://user-images.githubusercontent.com/88316764/130951879-1c6a854b-c759-4a76-8eeb-edd9edeaf7ba.png)

share your repo by 12:30 once completed




![Screenshot (65)](https://user-images.githubusercontent.com/88316764/130981031-7b3d6d2f-5255-4590-a343-e6f3aad63fc9.png)

## Task 1: Configure reverse proxy first without the db machine
The app should load without 3000 port instead of nginx default page

- Create a provision.sh on localhost:

<code>nano provision.sh</code>

    !#/bin/bash

    sudo apt-get update -y

    sudo apt-get upgrade -y

    sudo apt-get install nginx -y

- Go into the Vagrantfile:

<code>nano Vagrantfile</code>

    Vagrant.configure("2") do |config|

        config.vm.box = "ubuntu/xenial64"
        
        config.vm.network "private_network", ip: "192.168.10.100"
        
        config.vm.provision "shell", path: "provision.sh"

    end

- Install dependencies:

Go into virtual machine:

<code>vagrant up

vagrant ssh</code>

Change directory into home/ubuntu:

<code> cd /home/ubuntu </code>

Install dependencies:

<code>sudo apt-get install npm -y</code>

<code>sudo apt-get install python-software-properties -y</code>

<code>curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -</code>

<code>sudo apt-get install nodejs -y</code>

Go into the app directory:

<code>cd app

sudo npm install pm2 -g

npm install

npm start</code>

The app should run on 192.168.10.100:3000

## Task 2: Configure Reverse Proxy

- Go into the default file

<code>sudo nano /etc/nginx/sites-available/default</code>

 Add the following to the server{}:

    location / {
            proxy_pass http://localhost:3000;      
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection 'upgrade'; 
            proxy_set_header Host $host;
            proxy_cache_bypass $http_upgrade;      
        }

<code>sudo nginx -t

sudo systemctl restart nginx

npm start</code>

The app should run on 192.168.10.100

## Task 3: 

- Add environment variable

<code>echo 'export DB_HOST=192.168.10.150:27017/posts/' >> /etc/environment