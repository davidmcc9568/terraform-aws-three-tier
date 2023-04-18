
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 4.8.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

locals {
  common_tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}
