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

variable "enable_monitoring" {
  description = "Deploy Prometheus and Grafana"
  type        = bool
  default     = false
}

variable "argocd_admin_password" {
  description = "OverWrite to the ArgoCD Default Password"
  type        = string
  sensitive   = true
}

variable "crossplane_aws_access_key_id" {
  description = "AWS Access Key Id"
  type        = string
  sensitive   = true
}

variable "crossplane_aws_secret_access_key" {
  description = "AWS Secret Access Key"
  type        = string
  sensitive   = true
}
