variable "name" {
  description = "Application Name"
  type        = string
}

variable "tags" {
  description = "Common Tags"
}

variable "argocd_admin_password" {
  description = "OverWrite to the ArgoCD Default Password"
  type        = string
  sensitive   = true
}