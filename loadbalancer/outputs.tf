output "lbc_iam_policy_arn" {
  value = aws_iam_policy.lbc_iam_policy.arn
}

output "default_ingress_class_name" {
  description = "Default Ingress Class Name"
  value       = kubernetes_ingress_class_v1.ingress_class_default.metadata[0].name
}
