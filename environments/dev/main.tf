


locals {
  env = "dev"
}

provider "google" {
  project = "digital-maker-333106"
}


module "gke-node"{
    source                   = "../../modules/gke"
    network_name             = var.network_name
    auto_create_subnetworks  = var.auto_create_subnetworks
    subnet_name              = var.subnet_name
    ip_cidr_range            = var.ip_cidr_range
    region                   = var.region
    private_ip_google_access = var.private_ip_google_access
    cluster_name             = var.cluster_name
    location                 = var.location
    initial_node_count       = var.initial_node_count
    enable_legacy_abac       = var.enable_legacy_abac
    namespace_name           = var.namespace_name
    address_name             = var.address_name
    service_name             = var.service_name
    controller_name          = var.controller_name
    enable_binary_authorization = var.enable_binary_authorization

}