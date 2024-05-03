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
  vpc_id     = data.terraform_remote_state.vpc.outputs.vpc_id
  cluster_id = module.cluster.id
  oidc_arn   = module.cluster.oidc_arn
}

module "externaldns" {
  name               = local.name
  source             = "./externaldns"
  oidc_arn           = module.cluster.oidc_arn
  oidc_extracted_arn = module.cluster.oidc_extracted_arn
}

module "argocd" {
  name                  = local.name
  source                = "./argocd"
  tags                  = local.tags
  argocd_admin_password = var.argocd_admin_password
  depends_on            = [module.externaldns]
}

module "storage" {
  name               = local.name
  source             = "./storage"
  tags               = local.tags
  oidc_arn           = module.cluster.oidc_arn
  oidc_extracted_arn = module.cluster.oidc_extracted_arn
  depends_on         = [module.cluster]
}
