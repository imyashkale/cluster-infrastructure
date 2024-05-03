terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.31"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.20"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.13.0"
    }

  }

  backend "remote" {
    cloud {
      organization = "ULTRA"
      workspaces {
        name = "eks-cluster-infrastructure"
      }
    }
  }
}

provider "aws" {
  region = var.aws_region
}

locals {
  cluster_ca_certificate = base64decode(
    module.cluster.certificate_authority_data
  )
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.cluster.id
}

provider "kubernetes" {
  host                   = module.cluster.endpoint
  cluster_ca_certificate = local.cluster_ca_certificate
  token                  = data.aws_eks_cluster_auth.cluster.token
}

provider "helm" {
  kubernetes {
    host                   = aws_eks_cluster.eks.endpoint
    cluster_ca_certificate = local.cluster_ca_certificate
    token                  = data.aws_eks_cluster_auth.cluster.token
  }
}


data "terraform_remote_state" "vpc" {
  backend = "remote"
  config = {
    organization = "ULTRA"
    workspaces = {
      name = "networking-layer"
    }
  }
}
