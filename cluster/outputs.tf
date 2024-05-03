output "id" {
  description = "EKS Cluster Id"
  value       = aws_eks_cluster.eks.id
}

output "arn" {
  description = "Cluster ARN"
  value       = aws_eks_cluster.eks.arn
}

output "certificate_authority_data" {
  description = "certificate-authority-data of Cluster"
  value       = aws_eks_cluster.eks.certificate_authority[0].data
}

output "endpoint" {
  description = "EKS - Kubernetes API"
  value       = aws_eks_cluster.eks.endpoint
}

output "version" {
  description = "EKS Cluster Version"
  value       = aws_eks_cluster.eks.version
}

output "iam_role_name" {
  description = "EKS Cluster IAM Role Name"
  value       = aws_iam_role.eks_master_role.name
}

output "oidc_issuer_url" {
  description = "EKS Cluster OIDC Issuer URL"
  value       = aws_eks_cluster.eks.identity[0].oidc[0].issuer
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

output "primary_security_group_id" {
  description = "The cluster primary security group ID created by the EKS cluster on 1.14 or later. Referred to as 'Cluster security group' in the EKS console."
  value       = aws_eks_cluster.eks.vpc_config[0].cluster_security_group_id
}

# Node Group - Public

# output "node_group_public_id" {
#   description = "Public Node Group ID"
#   value       = var.enable_public_nodes ? null : aws_eks_node_group.eks_public_nodegroup[0].id
# }

# output "node_group_public_arn" {
#   description = "Public Node Group ARN"
#   value       = var.enable_public_nodes ? null : aws_eks_node_group.eks_public_nodegroup[0].arn
# }

# output "node_group_public_status" {
#   description = "Public Node Group status"
#   value       = var.enable_public_nodes ? null : aws_eks_node_group.eks_public_nodegroup[0].status
# }

# output "node_group_public_version" {
#   description = "Public Node Group Kubernetes Version"
#   value       = var.enable_public_nodes ? null : aws_eks_node_group.eks_public_nodegroup[0].version
# }

# Node Group - PRIVATE

output "node_group_private_id" {
  description = "Node Group 1 ID"
  value       = aws_eks_node_group.eks_private_nodegroup.id
}

output "node_group_private_arn" {
  description = "Private Node Group ARN"
  value       = aws_eks_node_group.eks_private_nodegroup.arn
}

output "node_group_private_status" {
  description = "Private Node Group status"
  value       = aws_eks_node_group.eks_private_nodegroup.status
}

output "node_group_private_version" {
  description = "Private Node Group Kubernetes Version"
  value       = aws_eks_node_group.eks_private_nodegroup.version
}
