terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.31"
    }
  }

  backend "remote" {
    cloud {
      organization = "ULTRA"
      workspaces { name = "eks-cluster-infrastructure" }
    }
  }
}

provider "aws" {
  region = var.aws_region
}


