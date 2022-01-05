variable "network_name" {
  type = string
}
variable "auto_create_subnetworks" {
  type = string
}

variable "subnet_name" {
  type = string
}
variable "ip_cidr_range" {
  type = string
}
variable "private_ip_google_access" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "region" {
  type =string
}
variable "location" {
  type = string
}
variable "namespace_name"{
    type = string
}
variable "initial_node_count"{
    type = string
}
variable "enable_legacy_abac"{
    type = string
}

variable "address_name"{
    type = string
}
variable "service_name"{
    type = string
}
variable "controller_name"{
    type = string
}

variable "enable_binary_authorization"{
    type = string
}
