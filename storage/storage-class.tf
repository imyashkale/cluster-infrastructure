resource "kubernetes_storage_class_v1" "ebs" {
  metadata {
    name = "ebs"
  }
  storage_provisioner = "ebs.csi.aws.com"
  volume_binding_mode = "WaitForFirstConsumer "
}
