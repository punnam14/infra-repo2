#!/bin/bash

sudo yum update -y

sudo yum install -y git python3 python3-pip
sudo yum install -y docker
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ec2-user
sudo chmod 666 /var/run/docker.sock

sudo ln -s /usr/bin/python3 /usr/bin/python
sudo python3 -m pip install --upgrade pip

cd /home/ec2-user
git clone https://github.com/punnam14/FastAPI-React.git
cd hottake/backend

sudo python3 -m pip install -r requirements.txt
sudo python3 -m pip install pytest
sudo chown -R ec2-user:ec2-user /home/ec2-user/FastAPI-React/backend
sudo chmod -R 775 /home/ec2-user/FastAPI-React/backend
sudo touch test.db
sudo chown ec2-user:ec2-user test.db
sudo chmod 666 test.db
sudo mkdir -p .pytest_cache
sudo chmod -R 777 .pytest_cache
