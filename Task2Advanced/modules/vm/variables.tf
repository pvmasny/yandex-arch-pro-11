variable "disk_name" {
    description = "disk name"
    type = string
}

variable "disk_type" {
    description = "disk type"
    type = string
}

variable "disk_size" {
    description = "disk size, GB"
    type = number
}

variable "vm_name" {
    description = "vm name"
    type = string
}

variable "zone" {
  description = "zone"
  type        = string
}

variable "cores" {
  description = "CPU cores"
  type        = number
}

variable "memory" {
  description = "RAM, GB"
  type        = number
}

variable "subnet_id" {
  description = "subnet id"
  type        = string
}

variable "nat" {
  description = "nat"
  type        = bool
  default = true
}

variable "ssh_user" {
    description = "ssh user"
    type = string  
}

variable "ssh_public_key" {
    description = "ssh public key"
    type = string  
}