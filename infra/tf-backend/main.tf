resource "azurerm_resource_group" "app" {
  name     = "lab12-app-rg"
  location = "eastus"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "lab12-aks"
  location            = azurerm_resource_group.app.location
  resource_group_name = azurerm_resource_group.app.name
  dns_prefix          = "lab12aks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}