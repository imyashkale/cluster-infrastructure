
module "storage" {
  name                                             = local.name
  source                                           = "./storage"
  tags                                             = local.tags
  aws_iam_openid_connect_provider_extract_from_arn = local.aws_iam_openid_connect_provider_extract_from_arn
}
