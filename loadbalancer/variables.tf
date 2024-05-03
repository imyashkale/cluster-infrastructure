variable "name" {
  description = "Application Name"
  type        = string
}

variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "oidc_arn" {
  description = "EKS OIDC Provider ARN"
  type        = string
}

variable "vpc_id" {
  description = "AWS VPC ID"
  type        = string
}

variable "cluster_id" {
  description = "AWS EKS Cluster ID"
  type        = string
}
