module "cluster" {
  name                = local.name
  source              = "./cluster"
  subnets_id          = data.terraform_remote_state.vpc.outputs.public_subnets
  private_subnets     = data.terraform_remote_state.vpc.outputs.private_subnets
  public_subnets      = data.terraform_remote_state.vpc.outputs.public_subnets
  enable_public_nodes = false
  tags                = local.tags
}

module "loadbalancer" {
  name       = local.name
  source     = "./loadbalancer"
  aws_region = var.aws_region
  depends_on = [module.cluster]
}

module "externaldns" {
  name                                             = local.name
  source                                           = "./externaldns"
  aws_iam_openid_connect_provider_extract_from_arn = module.cluster.aws_iam_openid_connect_provider_extract_from_arn
}

module "argocd" {
  name                  = local.name
  source                = "./argocd"
  tags                  = local.tags
  argocd_admin_password = var.argocd_admin_password
  depends_on            = [module.externaldns]
}

module "storage" {
  name                                             = local.name
  source                                           = "./storage"
  tags                                             = local.tags
  aws_iam_openid_connect_provider_arn              = module.cluster.aws_iam_openid_connect_provider.oidc_provider.arn
  aws_iam_openid_connect_provider_extract_from_arn = module.cluster.aws_iam_openid_connect_provider_extract_from_arn
  depends_on                                       = [module.cluster]
}
