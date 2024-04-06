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

variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
  default     = "ultra"
}

variable "cluster_service_ipv4_cidr" {
  description = "ipv4 cidr for the Kubernetes Cluster"
  type        = string
  default     = null
}

variable "cluster_version" {
  description = "Kubernetes Version"
  type        = string
  default     = null
}

variable "cluster_endpoint_public_access" {
  description = "Enable Amazon EKS Public API Server Endpoints"
  default     = true
}

variable "cluster_endpoint_private_access" {
  description = "Enable Amazon EKS Private API Server Endpoints"
  type        = bool
  default     = false
}


variable "cluster_endpoint_public_access_cidrs" {
  description = "Amazon EKS public API server endpoint CIDR Blocks"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "eks_oidc_root_ca_thumbprint" {
  type        = string
  description = "Thumbprint of Root CA for EKS OIDC, Valid until 2037"
  default     = "9e99a48a9960b14926bb7f3b02e22da2b0ab7280"
}

