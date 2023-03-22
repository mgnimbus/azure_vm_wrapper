#windows
output "availability_set_id" {
  value = module.vm-wrapper.availability_set_id
}

output "public_ip_address" {
  value = module.vm-wrapper.public_ip_address
}

output "network_security_group_id" {
  value = module.vm-wrapper.network_security_group_id
}

output "network_security_group_name" {
  value = module.vm-wrapper.network_security_group_name
}

output "public_ip_dns_name" {
  value = module.vm-wrapper.public_ip_dns_name
}
