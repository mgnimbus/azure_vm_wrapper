output "windows_availability_set_id" {
  value = module.winserver.availability_set_id
}

output "windows_ip_address" {
  value = module.winserver.public_ip_address
}

output "windows_nsg_id" {
  value = module.winserver.network_security_group_id
}

output "windows_nsg_name" {
  value = module.winserver.network_security_group_name
}

output "windows_public_ip_dns_name" {
  value = module.winserver.public_ip_dns_name
}
