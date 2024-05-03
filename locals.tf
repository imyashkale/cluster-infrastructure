locals {
  name = "${var.application}-${var.enviroment}"
  tags = {
    Enviroment  = var.enviroment
    Application = var.application
  }

  aws_iam_openid_connect_provider_extract_from_arn = element(
    split(
      "oidc-provider/", "${module.cluster.aws_iam_openid_connect_provider.oidc_provider.arn}"
  ), 1)
}
