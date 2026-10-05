#!/bin/bash
set -e

yum update -y

yum install -y docker

service docker start

usermod -aG docker ec2-user

docker container run -dt --name nginx -p 80:80 nginx:stable-alpine3.24-perl