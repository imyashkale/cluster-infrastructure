resource "kubernetes_namespace_v1" "argocd" {
  metadata {
    name = "argocd"
  }
}

resource "helm_release" "argocd" {

  depends_on = [ null_resource.nodes_ready ]
  
  name = "argocd"

  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = kubernetes_namespace_v1.argocd.metadata[0].name
  create_namespace = true
  version          = "3.35.4"

  values = [file("configurations/argocd/values.yaml")]

  set {
    name = "configs.secret.argocdServerAdminPassword"
    value = var.argocd_admin_password
  }
}
