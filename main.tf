#root module main.tf


module "rgroup" {
  source = "./modules/rgroup"
}

module "network" {
  source = "./modules/network"

  resource_group_name = "N01585456-assignment1-RG"
  


}

module "common" {
  source = "./modules/common"

  resource_group_name = "N01585456-assignment1-RG"
  location            = "eastus"

}

module "linux" {
  source   = "./modules/linux"
  vm_count = 2
  vm_size  = "Standard_B1s"

  subnet_id   = module.network.subnet_id
  vnet_name   = module.network.vnet_name
  subnet_name = module.network.subnet_name

  storage_account_uri = module.common.storage_account_uri
}


module "vm_windows" {
  source                          = "./modules/vmwindows"
  resource_group_name             = "N01585456-assignment1-RG"
  location                        = "eastus"
  subnet_id                       = module.network.subnet_id
  vm_name                         = "vm-windows"
  vm_size                         = "Standard_B1s"
  admin_username                  = "adminuser"
  admin_password                  = "Faiz@456"
  os_disk_name                    = "osdisk-windows"
  os_type                         = "Windows"
  dns_label                       = "public-ipwindows"
  avail_set_name                  = "5456windows-availaibility-set"
  public_ip_dns_label             = "win5456publicip"
  antimalware_extension_name      = "IaaSAntimalware"
  antimalware_extension_publisher = "Microsoft.Azure.Security"
  antimalware_extension_type      = "IaaSAntimalware"
  antimalware_extension_version   = "1.3"
  boot_diagnostics_storage_uri    = module.common.storage_account_uri

}

module "datadisk" {
  source              = "./modules/datadisk"
  location            = "eastus"
  resource_group_name = "N01585456-assignment1-RG"
  subnet_id           = module.network.subnet_id
  vm_count            = 3
  tags                = var.tags
  linux_vm_ids        = module.linux.vm_ids
  vmwindows_vm_id     = module.vm_windows.vm_id
}


module "loadbalancer" {
  source              = "./modules/loadbalancer"
   resource_group_name = "N01585456-assignment1-RG"
  location            = "eastus"
linux_vm_ids = module.linux.vm_ids

}



module "database" {
  source              = "./modules/database"
  prefix              = "n5456"
  location            = "eastus"
  resource_group_name = "N01585456-assignment1-RG"
  db_name             = "mydatabase"
  db_admin_username   = "adminuser"
  db_admin_password   = "Faiz@456"
}
