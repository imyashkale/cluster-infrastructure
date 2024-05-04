resource "kubernetes_ingress_v1" "router" {
  metadata {
    name      = "argocd"
    namespace = kubernetes_namespace_v1.monitoring.metadata[0].name
    annotations = {
      "alb.ingress.kubernetes.io/load-balancer-name"           = "${var.name}"
      "alb.ingress.kubernetes.io/scheme"                       = "internet-facing"
      "alb.ingress.kubernetes.io/healthcheck-protocol"         = "HTTP"
      "alb.ingress.kubernetes.io/healthcheck-port"             = "traffic-port"
      "alb.ingress.kubernetes.io/healthcheck-path"             = "/"
      "alb.ingress.kubernetes.io/healthcheck-interval-seconds" = 15
      "alb.ingress.kubernetes.io/healthcheck-timeout-seconds"  = 5
      "alb.ingress.kubernetes.io/success-codes"                = 200
      "alb.ingress.kubernetes.io/healthy-threshold-count"      = 2
      "alb.ingress.kubernetes.io/unhealthy-threshold-count"    = 2

      // SSL
      "alb.ingress.kubernetes.io/listen-ports"    = jsonencode([{ "HTTPS" = 443 }, { "HTTP" = 80 }])
      "alb.ingress.kubernetes.io/certificate-arn" = "${aws_acm_certificate.acm_cert.arn}"
      "alb.ingress.kubernetes.io/ssl-redirect"    = 443

      // External DNS
      "external-dns.alpha.kubernetes.io/hostname" : "prometheus.imyashkale.com"

      # Ingress Groups
      "alb.ingress.kubernetes.io/group.name"  = "ultra"
      "alb.ingress.kubernetes.io/group.order" = 20
    }
  }

  spec {
    ingress_class_name = var.ingress_class_name
    rule {
      host = "prometheus.imyashkale.com"
      http {
        path {
          backend {
            service {
              name = "prometheus-server"
              port {
                number = 80
              }
            }
          }
          path      = "/"
          path_type = "Prefix"
        }
      }
    }
  }

  // using argocd-server service which is deployed by helm chart called argocd
  depends_on = [helm_release.prometheus]
}



