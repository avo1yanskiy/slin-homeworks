#! /bin/bash
sudo yum update
sudo yum install epel-release
sudo yum install nginx
sudo systemctl start nginx
sudo systemctl enable nginx
echo "<h1>Deployed via Terraform</h1>" | sudo tee /usr/share/nginx/html/index.html