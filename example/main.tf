provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources-123"
  location = "East US"
}


module "linuxservers" {
  #source              = "Azure/compute/azurerm"
  source                           = "../"
  vm_hostname                      = "test-vm-1234"
  resource_group_name              = azurerm_resource_group.example.name
  vm_os_simple                     = "UbuntuServer"
  public_ip_dns                    = ["linsimplevmips-12343224"] // change to a unique name per datacenter region
  delete_data_disks_on_termination = true
  delete_os_disk_on_termination    = true
  vnet_subnet_id                   = module.network.vnet_subnets[0]
  enable_ssh_key                   = false
  identity_type                    = ""
  admin_password                   = "Champion@2"

  depends_on = [azurerm_resource_group.example]
}

module "network" {
  source              = "Azure/network/azurerm"
  use_for_each        = false
  resource_group_name = azurerm_resource_group.example.name
  subnet_prefixes     = ["10.0.1.0/24"]
  subnet_names        = ["subnet1"]

  depends_on = [azurerm_resource_group.example]
}

# output "linux_vm_public_name" {
#   value = module.linuxservers.public_ip_dns_name
# }

module "winserver" {
  #source              = "Azure/compute/azurerm"
  source                        = "../"
  resource_group_name           = azurerm_resource_group.example.name
  is_windows_image              = true
  delete_os_disk_on_termination = true
  vm_hostname                   = "mywinvm" // line can be removed if only one VM module per resource group
  admin_password                = "ComplxP@ssw0rd!"
  vm_os_simple                  = "WindowsServer"
  public_ip_dns                 = ["winsimplevmips-12343224"] // change to a unique name per datacenter region
  vnet_subnet_id                = module.network.vnet_subnets[0]

  depends_on = [azurerm_resource_group.example]

}
