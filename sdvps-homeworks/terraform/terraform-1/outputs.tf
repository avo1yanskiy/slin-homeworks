output "internal_ip_address_VM_01" {
  value = yandex_compute_instance.VM-01.network_interface.0.ip_address
}
output "external_ip_address_VM_01" {
  value = yandex_compute_instance.VM-01.network_interface.0.nat_ip_address
}

