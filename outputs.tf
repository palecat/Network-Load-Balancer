output "external_ip_address_vm_1" {
  description = "Public IP address of vm 1"
  value = module.ya_instance_1.external_ip_address
}

output "external_ip_address_vm_2" {
  description = "Public IP address of vm 2"
  value = module.ya_instance_2.external_ip_address
}

output "external_ip_address_lb" {
  description = "Public IP address of load balancer"
  value = yandex_lb_network_load_balancer.lb.listener.*.external_address_spec[0].*.address
}
