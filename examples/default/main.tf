resource "azurerm_resource_group" "main" {
  name     = "rg-example"
  location = "centralus"
}

module "test_credentials" {
  source = "../.."

  project = "example"

  owner_scope = {
    env = azurerm_resource_group.main.id
  }
}