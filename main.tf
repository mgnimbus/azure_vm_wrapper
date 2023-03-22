module "vm-wrapper" {
  source                 = "Azure/compute/azurerm"
  location               = var.location
  vm_hostname            = var.vm_hostname
  name_template_vm_linux = var.name_template_vm_linux
  resource_group_name    = var.resource_group_name
  vnet_subnet_id         = var.vnet_subnet_id

  nb_instances                     = var.nb_instances
  vm_size                          = var.vm_size
  delete_data_disks_on_termination = var.delete_data_disks_on_termination
  delete_os_disk_on_termination    = var.delete_os_disk_on_termination
  tags                             = var.tags
  zone                             = var.zone

  storage_os_disk_size_gb = var.storage_os_disk_size_gb
  storage_account_type    = var.storage_account_type

  boot_diagnostics = var.boot_diagnostics

  identity_ids  = var.identity_ids
  identity_type = var.identity_type

  admin_username = var.admin_username
  admin_password = var.admin_password
  custom_data    = var.custom_data

  enable_ssh_key = var.enable_ssh_key
  ssh_key        = var.ssh_key
  ssh_key_values = var.ssh_key_values

  os_profile_secrets = var.os_profile_secrets

  is_marketplace_image = var.is_marketplace_image
  vm_os_simple         = var.vm_os_simple
  vm_os_sku            = var.vm_os_sku
  vm_os_offer          = var.vm_os_offer
  vm_os_publisher      = var.vm_os_publisher

  vm_os_id = var.vm_os_id

  #windows_server
  license_type                     = var.license_type
  is_windows_image                 = var.is_windows_image
  name_template_vm_windows_os_disk = var.name_template_vm_windows_os_disk

}
