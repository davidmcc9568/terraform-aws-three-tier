#!/bin/bash
yum update -y
yum install -y httpd
systemctl enable httpd
systemctl start httpd