# Resource: Create External DNS IAM Policy 
resource "aws_iam_policy" "externaldns_iam_policy" {
  name        = "${local.name}-AllowExternalDNSUpdates"
  path        = "/"
  description = "External DNS IAM Policy"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "route53:ChangeResourceRecordSets"
        ],
        "Resource" : [
          "arn:aws:route53:::hostedzone/*"
        ]
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "route53:ListHostedZones",
          "route53:ListResourceRecordSets"
        ],
        "Resource" : [
          "*"
        ]
      }
    ]
  })
}

resource "aws_iam_role" "externaldns_iam_role" {
  name = "${local.name}-externaldns-iam-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRoleWithWebIdentity"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Federated = "${aws_iam_openid_connect_provider.oidc_provider.arn}"
        }
        Condition = {
          StringEquals = {
            "${local.aws_iam_openid_connect_provider_extract_from_arn}:aud" : "sts.amazonaws.com",
            "${local.aws_iam_openid_connect_provider_extract_from_arn}:sub" : "system:serviceaccount:external-dns:external-dns"
          }
        }
      },
    ]
  })

  tags = {
    tag-key = "AllowExternalDNSUpdates"
  }
}

resource "aws_iam_role_policy_attachment" "externaldns_iam_role_policy_attach" {
  policy_arn = aws_iam_policy.externaldns_iam_policy.arn
  role       = aws_iam_role.externaldns_iam_role.name
}

resource "kubernetes_namespace_v1" "external_dns" {
  metadata {
    name = "external-dns"
  }
}

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
