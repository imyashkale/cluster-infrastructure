# Terraform AWS EKS Cluster Module

This Terraform module creates an Amazon EKS cluster with specified configurations, including VPC settings and cluster logging. It uses an existing VPC infrastructure created with the `terraform-aws-vpc` module.
The cluster is accessible both publicly and privately based on the provided settings. Dependencies include attaching IAM policies for cluster creation and VPC resource controller.

## Access the Cluster

   To configure `kubectl` to use the new cluster, run the following command:

   ```bash
   aws eks update-kubeconfig --name <cluster_name> --region <region>
   ```

   Replace `<cluster_name>` with your EKS cluster name and `<region>` with your AWS region. This command retrieves the necessary credentials and configures `kubectl` to use the new cluster.

## Dependencies

This module depends on the VPC infrastructure created using the [terraform-aws-vpc](https://github.com/imyashkale/terraform-aws-vpc) module.

---
