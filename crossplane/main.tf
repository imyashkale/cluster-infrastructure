resource "kubernetes_namespace_v1" "crossplane" {
  metadata {
    name = "crossplane"
  }
}

resource "helm_release" "crossplane" {
  name      = kubernetes_namespace_v1.crossplane.metadata[0].name
  namespace = kubernetes_namespace_v1.crossplane.metadata[0].name

  repository = "https://charts.crossplane.io/stable"
  chart      = "crossplane"
}
  