#!/bin/bash

sudo yum update -y

sudo yum install -y git python3 python3-pip docker
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ec2-user

sudo ln -s /usr/bin/python3 /usr/bin/python
sudo python3 -m pip install --upgrade pip

cd /home/ec2-user
git clone https://github.com/punnam14/FastAPI-React.git
cd hottake/backend

sudo python3 -m pip install -r requirements.txt
sudo python3 -m pip install pytest
sudo chown -R ec2-user:ec2-user /home/ec2-user/hottake/backend
sudo chmod -R 775 /home/ec2-user/hottake/backend
sudo touch test.db
sudo chown ec2-user:ec2-user test.db
sudo chmod 666 test.db
sudo mkdir -p .pytest_cache
sudo chmod -R 777 .pytest_cache

aws configure list || {
    echo "AWS credentials not found, setting from environment variables..."
    aws configure set aws_access_key_id "${AWS_ACCESS_KEY_ID}"
    aws configure set aws_secret_access_key "${AWS_SECRET_ACCESS_KEY}"
    aws configure set region us-east-1
}