variable "default_node_pool" {
  type    = map(string)
  default = {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_A2_v2"
    type       = "VirtualMachineScaleSets"
  }
}

variable "network_plugin" {
  type    = string
  default = "kubenet"
}

variable "load_balancer_sku" {
  type    = string
  default ="Standard"
}

variable "kubernetes_version" {
  type    = string
  default = "1.19.6"
}

variable "admin_user"{
  type        = string
  description = "username for linux_profile"
  default     = ""
}

variable "ssh_key" {
  type        = string
  description = "ssh_key for admin_user"
  default     = ""
}

variable "tags" {
  type    = map(string)
  default = {
    Environment = "dev"
  }
}

variable "identity_type" {
  type    = string
  default = "SystemAssigned"
}