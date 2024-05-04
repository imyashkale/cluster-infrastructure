output "class_name" {
  description = "Block Storage Class Name"
  value       = kubernetes_namespace_v1.block_storage.metadata[0].name
}
