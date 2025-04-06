resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = var.aks_dns_name
  kubernetes_version  = var.kubernetes_version

  sku_tier = var.sku_tier ? "Standard" : "Free"

  default_node_pool {
    name                = var.node_pool_name
    node_count          = var.node_pool_count
    vm_size             = var.node_pool_vm_size
    type                = var.node_pool_type
    os_disk_size_gb     = var.os_disk_size_gb
    zones               = var.node_pool_availability_zone
    max_count           = var.node_pool_max_count #3
    min_count           = var.node_pool_min_count #1
    auto_scaling_enabled = true
    #vnet_subnet_id      = azurerm_subnet.aks_subnet.id
    max_pods            = var.max_pods
    tags                = var.tags
  }

  windows_profile {
    admin_username = "Microsoft"
    admin_password = "M1cr0s0ft@2023"
  }
  
  network_profile {
    network_plugin = "azure"
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = true
  azure_policy_enabled = true
  key_vault_secrets_provider {
    secret_rotation_enabled = true
  }

  storage_profile {
    blob_driver_enabled = true
  }

  oidc_issuer_enabled       = true
  workload_identity_enabled = true


  lifecycle {
    ignore_changes = [
      tags,
      sku_tier,
      default_node_pool[0].node_count,
      default_node_pool[0].max_pods,
      default_node_pool[0].vm_size,
      default_node_pool[0].os_disk_size_gb,
      kubernetes_version
      #api_server_authorized_ip_ranges
    ]
  }

  tags = var.tags
}

resource "azurerm_kubernetes_cluster_node_pool" "linux_wks_node_pool" {
  count                 = var.base_manage ? 1 : 0
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  name                  = var.linux_wks_node_pool_name
  node_count            = var.node_pool_count
  vm_size               = var.node_pool_vm_size_wks
  os_disk_size_gb       = var.os_disk_size_gb_wks
  zones                 = var.node_pool_availability_zone
  max_count             = var.node_pool_max_count #3
  min_count             = var.node_pool_min_count #1
  auto_scaling_enabled   = true
  #vnet_subnet_id        = azurerm_subnet.aks_subnet.id
  max_pods              = var.max_pods_wks
  tags                  = var.tags

  

  lifecycle {
    ignore_changes = [
      tags,
      node_count,
      max_pods,
      vm_size,
      os_disk_size_gb
    ]
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "windows_node_pool" {
  count                 = var.windows_support ? 1 : 0
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  name                  = var.win_node_pool_name
  node_count            = var.node_pool_count
  vm_size               = var.node_pool_vm_size_win
  os_disk_size_gb       = var.os_disk_size_gb_win
  os_type               = "Windows"
  os_sku                = var.os_sku_win
  zones                 = var.node_pool_availability_zone
  max_count             = var.node_pool_max_count #3
  min_count             = var.node_pool_min_count #1
  auto_scaling_enabled   = true
  
  #vnet_subnet_id        = azurerm_subnet.aks_subnet.id
  max_pods              = var.max_pods_win #
  tags                  = var.tags

  lifecycle {
    ignore_changes = [
      tags,
      node_count,
      max_pods,
      vm_size,
      os_disk_size_gb,
      os_sku
    ]
  }

}