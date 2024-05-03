resource "aws_iam_policy" "externaldns_iam_policy" {
  name        = "${var.name}-AllowExternalDNSUpdates"
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
  name = "${var.name}-externaldns-iam-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRoleWithWebIdentity"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Federated = "${var.oidc_arn}"
        }
        Condition = {
          StringEquals = {
            "${var.oidc_extracted_arn}:aud" : "sts.amazonaws.com",
            "${var.oidc_extracted_arn}:sub" : "system:serviceaccount:external-dns:external-dns"
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
