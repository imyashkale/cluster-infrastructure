resource "helm_release" "name" {
  name       = "grafana"
  namespace  = kubernetes_namespace_v1.monitoring.metadata[0].name
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"

  set {
    name  = "persistence.enabled"
    value = true
  }

  set {
    name  = "persistence.storageClassName"
    value = var.storage_class_name
  }

  set {
    name  = "service.type"
    value = "NodePort"
  }
}
