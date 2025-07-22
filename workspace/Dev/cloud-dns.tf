/**
 * Copyright 2025 
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

///////////////////////////////////////////////////////////
// DATA: Fetch existing VPC network information
///////////////////////////////////////////////////////////

data "google_compute_network" "network" {
  name    = var.dns_network         // Name of the shared VPC network
  project = var.dns_project_id // Project where the shared VPC resides
}

///////////////////////////////////////////////////////////
// MODULE: Cloud DNS configuration (private or public zones)
///////////////////////////////////////////////////////////
// This module creates DNS zones based on input list `cloud_dns`
// - Supports both public and private zones
// - Supports recordsets per zone
// - For private zones, it links the DNS to the shared VPC network
///////////////////////////////////////////////////////////

module "cloud-dns" {
  source  = "terraform-google-modules/cloud-dns/google"
  version = "6.0.0"

  for_each = { for dns in var.cloud_dns : dns.name => dns } // Create one DNS zone per entry in the list

  project_id                         = var.dns_project_id                             // Host project where DNS zones are created
  type                               = each.value.type                                 // Type of zone: 'private' or 'public'
  name                               = each.value.name                                 // DNS zone name (unique identifier)
  domain                             = each.value.domain                               // DNS domain name (e.g., example.internal.)
  private_visibility_config_networks = [data.google_compute_network.network.self_link] // For private DNS, associate with VPC
  recordsets                         = each.value.recordsets                           // Optional recordsets to create within the DNS zone
}

