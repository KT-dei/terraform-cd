### {env_prefix}-rg-apim

module "k8s_rg" {
  source   = "../../modules/resource-group"
  rg_name  = local.rg_k8s
  location = var.location
  tags     = var.tags
}
