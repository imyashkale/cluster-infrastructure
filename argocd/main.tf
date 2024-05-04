resource "kubernetes_namespace_v1" "argocd" {
  metadata {
    name = "argocd"
  }
}

resource "helm_release" "argocd" {

  name = "argocd"

  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = kubernetes_namespace_v1.argocd.metadata[0].name
  create_namespace = true
  version          = "3.35.4"

  values = [file("${path.module}/values.yaml")]

  set {
    name  = "configs.secret.argocdServerAdminPassword"
    value = var.argocd_admin_password
  }

  set {
    name = "server.ingress.annotations.alb\\.ingress\\.kubernetes\\.io/certificate-arn"
    value =  "${aws_acm_certificate.acm_cert.arn}"
  }
}
