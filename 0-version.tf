terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.31"
    }
  }

  backend "s3" {
    bucket = "infrastructure-statefile"
    key    = "infrastructure/eks/statefile"
    region = "ap-south-1"

    dynamodb_table = "infrastructure-state-lock"
  }
}

provider "aws" {
  region = var.aws_region
}


