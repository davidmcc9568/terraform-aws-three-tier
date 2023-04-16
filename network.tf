
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "main"
  cidr = "10.0.0.0/16"

  azs              = ["us-east-1a", "us-east-1b"]
  public_subnets   = ["10.0.101.0/24", "10.0.102.0/24"]
  private_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  database_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  public_subnet_names   = ["web-subnet-1", "web-subnet-2"]
  private_subnet_names  = ["app-subnet-1", "app-subnet-2"]
  database_subnet_names = ["db-subnet-1", "db-subnet-2"]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_security_group" "web" {
  name        = "web"
  description = "Allow inbound traffic for web tier"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group_rule" "web" {
  security_group_id = aws_security_group.web.id

  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "web_ssh" {
  security_group_id = aws_security_group.web.id

  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"] # Replace with your desired CIDR blocks for SSH access
}

resource "aws_security_group" "app" {
  name        = "app"
  description = "Allow inbound traffic for app tier"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group_rule" "app" {
  security_group_id = aws_security_group.app.id

  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24"]
}

resource "aws_security_group" "db" {
  name        = "db"
  description = "Allow inbound traffic for db tier"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group_rule" "db" {
  security_group_id = aws_security_group.db.id

  type        = "ingress"
  from_port   = 3306
  to_port     = 3306
  protocol    = "tcp"
  cidr_blocks = ["10.0.3.0/24", "10.0.4.0/24"]
}
