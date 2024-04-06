output "cluster_id" {
  description = "EKS Cluster Id"
  value       = aws_eks_cluster.eks.id
}

output "cluster_arn" {
  description = "Cluster ARN"
  value       = aws_eks_cluster.eks.arn
}

output "cluster_certificate_authority_data" {
  description = "certificate-authority-data of Cluster"
  value       = aws_eks_cluster.eks.certificate_authority[0].data
}

output "cluster_endpoint" {
  description = "EKS - Kubernetes API"
  value       = aws_eks_cluster.eks.endpoint
}

output "cluster_version" {
  description = "EKS Cluster Version"
  value = aws_eks_cluster.eks.version
}

output "cluster_iam_role_name" {
  description = "EKS Cluster IAM Role Name"
  value = aws_iam_role.eks_master_role.name
}

output "cluster_iam_role_arn" {
  description = "EKS Cluster IAM Role ARN"
  value = aws_iam_role.eks_master_role.arn
}

output "cluster_oidc_issuer_url" {
  description = "EKS Cluster OIDC Issuer URL"
  value = aws_eks_cluster.eks.identity[0].oidc[0].issuer
}

output "cluster_primary_security_group_id" {
  description = "The cluster primary security group ID created by the EKS cluster on 1.14 or later. Referred to as 'Cluster security group' in the EKS console."
  value       = aws_eks_cluster.eks.vpc_config[0].cluster_security_group_id
}

# Node Group - Public

output "node_group_public_id" {
  description = "Public Node Group ID"
  value       = aws_eks_node_group.eks_public_nodegroup.id
}

output "node_group_public_arn" {
  description = "Public Node Group ARN"
  value       = aws_eks_node_group.eks_public_nodegroup.arn
}

output "node_group_public_status" {
  description = "Public Node Group status"
  value       = aws_eks_node_group.eks_public_nodegroup.status 
}

output "node_group_public_version" {
  description = "Public Node Group Kubernetes Version"
  value       = aws_eks_node_group.eks_public_nodegroup.version
}

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
