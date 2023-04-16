
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "david-dev"
}

locals {
  common_tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
