terraform {
  required_version = ">= 1.6.0"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.140"
    }
  }
}

provider "yandex" {
  token     = var.yc_token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

module "vm" {
  source = "../../modules/vm"

  disk_name         = var.disk_name
  disk_type         = var.disk_type
  disk_size         = var.disk_size
  vm_name           = var.vm_name
  zone              = var.zone
  cores             = var.cores
  memory            = var.memory
  subnet_id         = var.subnet_id
  nat               = var.nat
  ssh_user          = var.ssh_user
  ssh_public_key    = var.ssh_public_key
}