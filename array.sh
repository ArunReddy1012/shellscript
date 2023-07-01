#!/bin/bash

date=$(date +%F-%H-%M-%S)
log=$date.log

uid=$(id -u)
#checking for root user permissions
if [ $uid -ne 0 ]
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
        echo " Installing $2 "
    fi
}

#tools to be used
tools=("git" "wget" "vim" "nano")

#calling a function and passing parameters
validate $? $tools[@]
yum install $tools[@] -y >> $log
echo " Installation of $tools[@] is successull" >> $log

# validate $? wget
# yum install wget -y >> $log
# echo " Installation of wget is successull" >> $log

# validate $? vim 
# yum install vim -y >> $log
# echo " Installation of vim is successull" >> $log