output "cluster_id" {
  description = "EKS Cluster Id"
  value       = module.cluster.cluster_id
}

output "cluster_arn" {
  description = "Cluster ARN"
  value       = module.cluster.cluster_arn
}

output "cluster_certificate_authority_data" {
  description = "certificate-authority-data of Cluster"
  value       = module.cluster.certificate_authority_data
}

output "cluster_endpoint" {
  description = "EKS - Kubernetes API"
  value       = module.cluster.endpoint
}

output "cluster_version" {
  description = "EKS Cluster Version"
  value       = module.cluster.version
}

output "cluster_iam_role_name" {
  description = "EKS Cluster IAM Role Name"
  value       = module.cluster.iam_role_name
}

output "cluster_oidc_issuer_url" {
  description = "EKS Cluster OIDC Issuer URL"
  value       = module.cluster.oidc_issuer_url
}

output "cluster_primary_security_group_id" {
  description = "The cluster primary security group ID created by the EKS cluster on 1.14 or later. Referred to as 'Cluster security group' in the EKS console."
  value       = module.cluster.primary_security_group_id
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
  value       = module.cluster.node_group_private_id
}

output "node_group_private_arn" {
  description = "Private Node Group ARN"
  value       = module.cluster.node_group_private_arn
}

output "node_group_private_status" {
  description = "Private Node Group status"
  value       = module.cluster.node_group_private_status
}

output "node_group_private_version" {
  description = "Private Node Group Kubernetes Version"
  value       = module.cluster.node_group_private_version
}

output "lbc_iam_policy_arn" {
  description = "Loadbalancer Private IAM Policy ARN"
  value       = module.loadbalancer.aws_iam_policy.lbc_iam_policy.arn
}

output "externaldns_iam_policy_arn" {
  description = "External Loadbalancer IAM Policy ARN"
  value       = module.externaldns.aws_iam_policy.externaldns_iam_policy.arn
}

output "externaldns_iam_role_arn" {
  description = "External DNS IAM Role ARN"
  value       = module.externaldns.aws_iam_role.externaldns_iam_role.arn
}

