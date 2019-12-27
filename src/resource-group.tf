resource "azurerm_resource_group" "practice" {
  name     = "practice-rg"
  location = "West EUROPE"

  tags = {
    environment = "Production"
  }
}