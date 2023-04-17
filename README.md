# AWS Three Tier Architecture with Terraform

This repository contains Terraform configuration files to set up a multi-tier architecture on AWS, including a VPC, database, and compute resources. The infrastructure consists of public-facing web servers, private application servers, and a MySQL database in separate subnets for better security and isolation.

**Architecture Overview**<br>
VPC with public, private, and database subnets
Application Load Balancer (ALB) for web and app tiers
Auto Scaling Groups (ASG) for web and app tiers
MySQL RDS instance for database tier
Security groups to control traffic between the tiers

**Prerequisites**<br>
An AWS account with appropriate permissions
Terraform v1.0.0 or later
AWS CLI v2.0.0 or later

**Configuration**<br>
main.tf<br>
This file contains the required providers and AWS profile configuration.

network.tf<br>
This file sets up the VPC and its subnets, as well as security groups and rules for the web, app, and database tiers.

database.tf<br>
This file creates a MySQL RDS instance, security group, and rules for the database tier.
Currently, RDS is set multi_az = false. To enable multi_az, set value to true<br>

compute.tf<br>
This file sets up the compute resources for the web and app tiers, including launch configurations, auto scaling groups, application load balancers, target groups, and listeners.

**Usage**

Clone this repository:<br>
git clone https://github.com/yourusername/terraform-aws-infrastructure.git
cd terraform-aws-infrastructure

Terraform AWS Infrastructure<br>
This repository contains Terraform configuration files to set up a multi-tier architecture on AWS, including a VPC, database, and compute resources. The infrastructure consists of public-facing web servers, private application servers, and a MySQL database in separate subnets for better security and isolation.

**Architecture Overview** <br>
VPC with public, private, and database subnets
Application Load Balancer (ALB) for web and app tiers
Auto Scaling Groups (ASG) for web and app tiers
MySQL RDS instance for database tier
Security groups to control traffic between the tiers

**Prerequisites**<br>
An AWS account with appropriate permissions
Terraform v1.0.0 or later
AWS CLI v2.0.0 or later

**Configuration**<br>
main.tf<br>
This file contains the required providers and AWS profile configuration.

network.tf<br>
This file sets up the VPC and its subnets, as well as security groups and rules for the web, app, and database tiers.

database.tf<br>
This file creates a MySQL RDS instance, security group, and rules for the database tier.

compute.tf<br>
This file sets up the compute resources for the web and app tiers, including launch configurations, auto scaling groups, application load balancers, target groups, and listeners.

**Usage**<br>
Clone this repository:<br>
git clone https://github.com/yourusername/terraform-aws-infrastructure.git<br>
cd terraform-aws-infrastructure<br>

Initialize the Terraform working directory:<br>
terraform init

Review the changes to be applied by running:<br>
terraform plan

Apply the changes:<br>
terraform apply

To destroy the infrastructure, run:<br>
terraform destroy

**Contributing**<br>
Feel free to submit pull requests for any improvements or bug fixes. Please ensure that your changes are well-tested and documented.