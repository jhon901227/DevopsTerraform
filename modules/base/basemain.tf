#Configure resource
resource "azurerm_resource_group" "main_resource_group" {
  name     = var.name
  location = var.location
  tags = var.tags
}
