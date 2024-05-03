output "iam_policy_arn" {
  description = "External DNS IAM Policy ARN"
  value       = aws_iam_policy.externaldns_iam_policy.arn
}

output "iam_role_arn" {
  description = "External DNS Role ARN"
  value       = aws_iam_role.externaldns_iam_role.arn
}
