variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "enviroment" {
  type        = string
  description = "Application Deployment Enviroment"
}

variable "application" {
  type        = string
  description = "Application Name"
}

variable "argocd_admin_password" {
  description = "OverWrite to the ArgoCD Default Password"
  type        = string
  sensitive   = true
}
