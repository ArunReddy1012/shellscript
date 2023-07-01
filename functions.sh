#!/bin/bash

#checking for root user permissions
if [ uid -ne 0 ]
then
    echo "Please run a a sudo user"
    exit 1
fi

#validation function block
validate () {
    if [ $1 -ne 0 ]
    then
        echo "Installation of $2 is failed"
        exit 2
    else
        echo " Installation of $2 is successfull"
    fi
}

#calling a function and passing parameters
validate $? Git
yum install git -y

validate $? wget
yum install wget -y