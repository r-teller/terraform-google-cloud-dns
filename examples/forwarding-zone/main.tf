/**
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

module "dns-forwarding-zone" {
  source  = "terraform-google-modules/cloud-dns/google"
  version = "~> 5.0"

  project_id = var.project_id
  type       = "forwarding"
  name       = var.name
  domain     = var.domain
  labels     = var.labels

  private_visibility_config_networks = [var.network_self_link]
  target_name_server_addresses = [
    {
      ipv4_address    = "8.8.8.8",
      forwarding_path = "default"
    },
    {
      ipv4_address    = "8.8.4.4",
      forwarding_path = "default"
    }
  ]
}
