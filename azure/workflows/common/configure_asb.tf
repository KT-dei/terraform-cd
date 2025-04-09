data "azurerm_resource_group" "rg" {
  name = local.rg_name
}


module "servicebus" {
  source              = "../../modules/servicebus"
  name                = local.asb_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  rg_name             = data.azurerm_resource_group.rg.name
  sku                 = "Standard"

  queues              = var.queues
  topics              = var.topics

  subscriptions = [
    {
      topic = "topic-inventory"
      name  = "sub-products"
    }
  ]

  subscription_rules = [
    {
      topic        = "topic-inventory"
      subscription = "sub-products"
      name         = "rule-high-priority"
      rule_type    = "SqlFilter"
      filter_type  = "SqlFilter"
      sql_filter   = "priority = 'high'"
    }
  ]

  tags = {
    environment = var.env_name
    team        = "platform"
  }
}
