output "internal_ip_address" {
  description = "Internal IP address"
  value = yandex_compute_instance.vm.network_interface[0].ip_address
}

output "external_ip_address" {
  description = "Public IP address"
  value = yandex_compute_instance.vm.network_interface[0].nat_ip_address
}
