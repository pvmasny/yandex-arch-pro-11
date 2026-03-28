output "instance_id" {
  description = "ID созданной виртуальной машины"
  value       = yandex_compute_instance.vm.id
}

output "instance_name" {
  description = "Имя виртуальной машины"
  value       = yandex_compute_instance.vm.name
}

output "disk_id" {
  description = "ID подключённого диска (если создан)"
  value       = var.disk_size > 0 ? yandex_compute_disk.boot.id : null
}

output "internal_ip_address" {
  description = "Internal IP"
  value       = yandex_compute_instance.vm.network_interface[0].ip_address
}