resource "kubernetes_namespace_v1" "crossplane" {
  metadata {
    name = "crossplane-system"
  }
}

resource "helm_release" "crossplane" {
  name        = "crossplane"
  chart       = "crossplane"
  repository  = "https://charts.crossplane.io/stable/"
  version     = "1.8.1"
  namespace   = kubernetes_namespace_v1.crossplane.metadata[0].name
  description = "Crossplane Helm chart"
}
