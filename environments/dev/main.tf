# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


locals {
  env = "dev"
}

provider "google" {
  project = "digital-maker-333106"
}

# module "vpc" {
#   source  = "../modules/vpc"
#   project = "${var.project}"
#   env     = "${local.env}"
# }

# module "gke" {
#   source  = "../../modules/http_server"
#   project = "${var.project}"
#   subnet  = "${module.vpc.subnet}"
# }

# module "firewall" {
#   source  = "../../modules/firewall"
#   project = "${var.project}"
#   subnet  = "${module.vpc.subnet}"
# }


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