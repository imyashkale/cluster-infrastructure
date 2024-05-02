
variable "name" {
  description = "Application Name"
  type        = string
}

variable "aws_iam_openid_connect_provider_arn" {
  type = string
  description = "AWS IAM OpenID Connect ARN"
}

variable "aws_iam_openid_connect_provider_extract_from_arn" {
  type        = string
  description = "The IAM OpenId Connect Provider ARN"
}


variable "tags" {
  description = "Common Tags"
}

