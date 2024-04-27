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
    aws_eks_cluster.eks.certificate_authority[0].data
  )
}

provider "kubernetes" {
  host                   = data.terraform_remote_state.eks.outputs.cluster_endpoint
  cluster_ca_certificate = local.cluster_ca_certificate
  token                  = data.aws_eks_cluster_auth.cluster.token
}

provider "helm" {
  kubernetes {
    host                   = data.terraform_remote_state.eks.outputs.cluster_endpoint
    cluster_ca_certificate = local.cluster_ca_certificate
    token                  = data.aws_eks_cluster_auth.cluster.token
  }
}
