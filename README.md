# AWS Three Tier Architecture with Terraform

This repository contains Terraform configuration files to set up a multi-tier architecture on AWS, including a VPC, database, and compute resources. The infrastructure consists of public-facing web servers, private application servers, and a MySQL database in separate subnets for better security and isolation.

**Architecture Overview**
VPC with public, private, and database subnets
Application Load Balancer (ALB) for web and app tiers
Auto Scaling Groups (ASG) for web and app tiers
MySQL RDS instance for database tier
Security groups to control traffic between the tiers

**Prerequisites**
An AWS account with appropriate permissions
Terraform v1.0.0 or later
AWS CLI v2.0.0 or later

**Configuration**
main.tf
This file contains the required providers and AWS profile configuration.

network.tf
This file sets up the VPC and its subnets, as well as security groups and rules for the web, app, and database tiers.

database.tf
This file creates a MySQL RDS instance, security group, and rules for the database tier.
Currently, RDS is set multi_az = false. To enable multi_az, set value to true<br>

compute.tf
This file sets up the compute resources for the web and app tiers, including launch configurations, auto scaling groups, application load balancers, target groups, and listeners.

**Usage**

Clone this repository:
git clone https://github.com/yourusername/terraform-aws-infrastructure.git
cd terraform-aws-infrastructure

Terraform AWS Infrastructure
This repository contains Terraform configuration files to set up a multi-tier architecture on AWS, including a VPC, database, and compute resources. The infrastructure consists of public-facing web servers, private application servers, and a MySQL database in separate subnets for better security and isolation.

Architecture Overview
VPC with public, private, and database subnets
Application Load Balancer (ALB) for web and app tiers
Auto Scaling Groups (ASG) for web and app tiers
MySQL RDS instance for database tier
Security groups to control traffic between the tiers
Prerequisites
An AWS account with appropriate permissions
Terraform v1.0.0 or later
AWS CLI v2.0.0 or later
Configuration
main.tf
This file contains the required providers and AWS profile configuration.

network.tf
This file sets up the VPC and its subnets, as well as security groups and rules for the web, app, and database tiers.

database.tf
This file creates a MySQL RDS instance, security group, and rules for the database tier.

compute.tf
This file sets up the compute resources for the web and app tiers, including launch configurations, auto scaling groups, application load balancers, target groups, and listeners.

Usage
Clone this repository:

bash
Copy code
git clone https://github.com/yourusername/terraform-aws-infrastructure.git
cd terraform-aws-infrastructure

Initialize the Terraform working directory:
terraform init

Review the changes to be applied by running:
terraform plan

Apply the changes:
terraform apply

To destroy the infrastructure, run:
terraform destroy

**Contributing**
Feel free to submit pull requests for any improvements or bug fixes. Please ensure that your changes are well-tested and documented.