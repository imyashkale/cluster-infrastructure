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
  atomic      = true

  set {
    name  = "provider.packages"
    value = "{xpkg.upbound.io/crossplane-contrib/provider-aws:v0.39.0}"
  }
}

resource "kubernetes_secret_v1" "provider_config" {
  metadata {
    name      = "aws-secret"
    namespace = kubernetes_namespace_v1.crossplane.metadata[0].name
  }
  data = {
    creds = base64encode(local.aws_credentials)
  }
}

