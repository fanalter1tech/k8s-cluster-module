resource "azurerm_resource_group" "this" {
    name     = "${this}-kubernetes-resource-group"
    location = var.location
}

resource "azurerm_kubernetes_cluster" "this" {
  name                = "${this}-terraform-cluster"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  dns_prefix          = "${this}-terraform-cluster"
  kubernetes_version  = var.kubernetes_version

  for_each = var.default_node_pool
  default_node_pool {
    name       = each.value.name
    node_count = each.value.node_count
    vm_size    = each.value.vm_size
    type       = each.value.type
  }


  identity {
    type = var.identity_type
  }

  linux_profile {
    admin_username = var.admin_user
    ssh_key {
        key_data = file(var.ssh_public_key)
    }
  }

  network_profile {
    network_plugin = var.network_plugin
    load_balancer_sku = var.load_balancer_sku
  }
}