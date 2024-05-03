variable "name" {
  description = "Application Name"
  type        = string
}

variable "oidc_arn" {
  type = string
  description = "AWS IAM OpenID Connect ARN"
}

variable "oidc_extracted_arn" {
  type        = string
  description = "The IAM OpenId Connect Provider ARN"
}


variable "tags" {
  description = "Common Tags"
}

