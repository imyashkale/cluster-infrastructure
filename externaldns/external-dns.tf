resource "helm_release" "external_dns" {

  depends_on = [aws_iam_role.externaldns_iam_role]
  name       = "external-dns"

  repository = "https://kubernetes-sigs.github.io/external-dns/"
  chart      = "external-dns"

  namespace = kubernetes_namespace_v1.external_dns.metadata[0].name

  set {
    name  = "image.repository"
    value = "registry.k8s.io/external-dns/external-dns"
  }

  set {
    name  = "serviceAccount.create"
    value = "true"
  }

  set {
    name  = "serviceAccount.name"
    value = "external-dns"
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = aws_iam_role.externaldns_iam_role.arn
  }

  set {
    name  = "provider"
    value = "aws"
  }

  set {
    name  = "policy"
    value = "sync"
  }
}
