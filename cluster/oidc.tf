data "aws_partition" "current" {}

resource "aws_iam_openid_connect_provider" "oidc_provider" {
  
  client_id_list  = ["sts.${data.aws_partition.current.dns_suffix}"]
  thumbprint_list = [var.eks_oidc_root_ca_thumbprint]
  url             = aws_eks_cluster.eks.identity[0].oidc[0].issuer

  tags = merge(
    {
      Name = "${var.name}"
    },
    var.tags
  )
}

output "oidc_arn" {
  description = "AWS IAM Open ID Connect Provider ARN"
  value       = aws_iam_openid_connect_provider.oidc_provider.arn
}

output "oidc_extracted_arn" {
  description = "AWS IAM Open ID Connect Provider extract from ARN"
  value = element(
    split(
      "oidc-provider/", "${aws_iam_openid_connect_provider.oidc_provider.arn}"
  ), 1)
}
