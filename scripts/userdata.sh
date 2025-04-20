#!/bin/bash

yum update -y
amazon-linux-extras install epel -y
yum install nginx -y
yum install git -y
yum install gcc -y
yum install build-essential -y
yum install python3-pip python3-devel python3-setuptools -y



aws configure set region us-east-1

mkdir -p /var/www

# update me
git clone https://github.com/vivekbagul02/web_app.git /var/www

cd /var/www

git config core.fileMode false

# update me
aws s3 cp s3://tci-s3-bucket/simple-flask/.env .env

chmod +x scripts/post_userdata.sh

./scripts/post_userdata.sh
