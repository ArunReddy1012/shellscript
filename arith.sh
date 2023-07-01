#!/bin/bash

sudo yum update -y

#Install Docker
sudo dnf install -y docker

#checking exit-code
ext-code=$(echo $?)
if [ ${ext-code} -eq 0]
then
    echo "Successfully Installed docker"
else
    echo "error in installing docker"
    exit 1
fi

echo "Hi"
