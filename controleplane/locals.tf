locals {
  aws_credentials = <<EOF
[default]
aws_access_key_id = ${var.aws_access_key_id}
aws_secret_access_key = ${var.aws_secret_access_key}
EOF
}
