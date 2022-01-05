resource "google_compute_network" "network1" {
    name = var.network_name
    auto_create_subnetworks = var.auto_create_subnetworks
}


resource "google_compute_subnetwork" "subnet1" {
   name                     = var.subnet_name
   ip_cidr_range            = var.ip_cidr_range 
   network                  = google_compute_network.network1.self_link
   region                   = var.region
   private_ip_google_access = var.private_ip_google_access
}

resource "google_container_cluster" "cluster1" {
  name               = var.cluster_name
  location           = var.location
  initial_node_count = var.initial_node_count
  min_master_version = data.google_container_engine_versions.default.latest_master_version
  network            = google_compute_network.network1.name
  subnetwork         = google_compute_subnetwork.subnet1.name
  enable_legacy_abac = var.enable_legacy_abac
  enable_binary_authorization = var.enable_binary_authorization 
}


