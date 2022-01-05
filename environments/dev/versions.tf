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


terraform {
 required_version = "~> 1.0.0"
}

# provider "kubernetes" {
#   version = "~> 1.10.0"
#   host    = google_container_cluster.default.endpoint
#   token   = data.google_client_config.current.access_token
#   client_certificate = base64decode(google_container_cluster.default.master_auth[0].client_certificate,)
#   client_key = base64decode(google_container_cluster.default.master_auth[0].client_key)
#   cluster_ca_certificate = base64decode(google_container_cluster.default.master_auth[0].cluster_ca_certificate,)
# }


