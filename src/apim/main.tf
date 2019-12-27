resource "azurerm_resource_group" "komluk" {
  name     = "komluk-resources"
  location = "West Europe"
}

resource "azurerm_api_management" "komluk" {
  name                = "komluk-apim"
  location            = "${azurerm_resource_group.komluk.location}"
  resource_group_name = "${azurerm_resource_group.komluk.name}"
  publisher_name      = "My Company"
  publisher_email     = "company@terraform.io"

  sku_name = "Developer_1"
}

resource "azurerm_api_management_api" "komluk" {
  name                = "komluk-api"
  resource_group_name = "${azurerm_resource_group.komluk.name}"
  api_management_name = "${azurerm_api_management.komluk.name}"
  revision            = "1"
  display_name        = "komluk API"
  path                = "komluk"
  protocols           = ["https"]

  import {
    content_format = "swagger-link-json"
    content_value  = "http://conferenceapi.azurewebsites.net/?format=json"
  }
}