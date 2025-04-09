locals {
  #rg_name               = "rg-ede-${var.user_name}-${var.env_prefix}-${var.env_name}"
  rg_name               = "rg-ede-labenv"
  asb_name = "${var.env_prefix}-${var.env_name}-${var.cluster_index}-asb"
}