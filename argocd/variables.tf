variable "name" {
  description = "Application Name"
  type        = string
}

variable "tags" {
  description = "Common Tags"
}

variable "ingress_class_name" {
  description = "Ingress Class Name"
  type        = string
}

variable "argocd_admin_password" {
  description = "OverWrite to the ArgoCD Default Password"
  type        = string
  sensitive   = true
}
