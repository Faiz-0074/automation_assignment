resource "azurerm_resource_group" "rgroup5456" {
  name     = "N01585456-assignment1-RG"
  location = "eastus"
  
  tags = {
    	Project        = "Automation Project – Assignment 1"
    	Name           = "faiz.radhanpuri"
	ExpirationDate = "2023-06-30"
	Environment    = "Lab"
  }
}
data "azurerm_resource_group" "existing" {
  name = "N01585456-assignment1-RG"
}

