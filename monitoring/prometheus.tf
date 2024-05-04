resource "kubernetes_namespace_v1" "monitoring" {
  metadata {
    name = "monitoring"
  }
}
resource "helm_release" "prometheus" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  namespace  = kubernetes_namespace_v1.monitoring.metadata[0].name

  values = [
    file("${path.module}/values.yaml")
  ]

  set {
    name  = "ingress.annotations\\.alb\\.ingress\\.kubernetes\\.io/load-balancer-name"
    value = var.name
  }

  set {
    name  = "ingress.annotations.\\alb\\.ingress\\.kubernetes\\.io/listen-ports"
    value = jsonencode([{ HTTPS = 443 }, { HTTP = 80 }])
  }

  set {
    name  = "ingress.annotations\\.alb\\.ingress\\.kubernetes\\.io/certificate-arn"
    value = aws_acm_certificate.acm_cert.arn
  }
}
