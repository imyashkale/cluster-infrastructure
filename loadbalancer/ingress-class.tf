resource "kubernetes_ingress_class_v1" "ingress_class_default" {
  metadata {
    name = "aws-ingress-class"
    annotations = {
      "ingressclass.kubernetes.io/is-default-class" = "true"
    }
  }
  spec {
    controller = "ingress.k8s.aws/alb"
  }
}
