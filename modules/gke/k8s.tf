data "google_client_config" "current" {

}

data "google_container_engine_versions" "default" {
  location = var.location
}

provider "kubernetes" {
  //version = "~> 1.10.0"
  host    = google_container_cluster.cluster1.endpoint
  token   = data.google_client_config.current.access_token
  client_certificate = base64decode(
    google_container_cluster.cluster1.master_auth[0].client_certificate,
  )
  client_key = base64decode(google_container_cluster.cluster1.master_auth[0].client_key)
  cluster_ca_certificate = base64decode(
    google_container_cluster.cluster1.master_auth[0].cluster_ca_certificate,
  )

}
