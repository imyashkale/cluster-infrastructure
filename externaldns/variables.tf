variable "name" {
  description = "Application Name"
  type        = string
}

variable "oidc_extracted_arn" {
  type        = string
  description = "The IAM OpenId Connect Provider ARN"
}
variable "oidc_arn" {
  description = "EKS OIDC Provider ARN"
  type        = string
}
