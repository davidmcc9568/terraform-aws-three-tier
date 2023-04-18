# variables.tf

variable "aws_region" {
  description = "AWS region to deploy the infrastructure"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS CLI profile to use for authentication"
  default     = "default"
}

variable "environment" {
  description = "Environment for the infrastructure (e.g., dev, staging, prod)"
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "private_subnets" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "database_subnets" {
  description = "CIDR blocks for database subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "web_instance_type" {
  description = "EC2 instance type for the web tier"
  default     = "t2.micro"
}

variable "app_instance_type" {
  description = "EC2 instance type for the app tier"
  default     = "t2.micro"
}

variable "db_instance_class" {
  description = "RDS instance class for the database tier"
  default     = "db.t2.micro"
}

variable "db_username" {
  description = "Username for the RDS instance"
  default     = "admin"
}

variable "db_password" {
  description = "Password for the RDS instance"
  sensitive   = true
}
