#!/bin/bash

date=$(date +%F)
log_file=$date.log
uid=$(id -u)

#colors
R="\e[31m"
G="\e[32m"
N="\e[0m"

#checking for root user permissions
if [ $uid -ne 0 ]
then
    echo  -e "$R please try with root permissions $N"
    exit 1
fi

#validating function
validate () {
    if [ $1 -ne 0 ]
    then
        echo -e "$2... is $R Failed $N"
        exit 2
    else
        echo -e "$2... is $G Successfull $N"
    fi
}


#install basic tools
yum install wget vim net-tools -y &&>> $log_file

#installing mariadb
yum install mariadb-server -y  &>> $log_file
validate $? "Installing mariadb"

#start mariadb
systemctl start mariadb &>> $log_file
validate $? "starting mariadb"

#enable mariadb
systemctl enable mariadb &>> $log_file
validate $? "enabling mariadb"

#CREATE DB, TABLE AND GRANTS
echo " CREATE DATABASE student_db;

use student_db;

CREATE TABLE if not exists student_details(id INT NOT NULL AUTO_INCREMENT, name VARCHAR(10) NOT NULL, age INT NOT NULL, PRIMARY KEY (id) );

grant all privileges on student_db.* to 'student'@'localhost' identified by 'student@1';" > /tmp/student.sql

mysql < /tmp/student.sql 

validate $? "CREATE DB, TABLE AND GRANTS" 


#TOMCAT

#install java
 dnf install java-11-openjdk-devel

validate $? "java"