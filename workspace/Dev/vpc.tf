/*
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
// MODULE: Create VPC and Subnets
///////////////////////////////////////////////////////////
// This module creates Virtual Private Cloud (VPC) networks 
// and subnets in the specified GCP projects. It supports 
// secondary IP ranges and deletes default internet gateway 
// routes if required.
///////////////////////////////////////////////////////////

module "create_vpc" {
  source                                 = "terraform-google-modules/network/google"
  version                                = "11.1.1"                                          // Path to the shared VPC module
  for_each                               = var.vpc_list                                      // Iterate over all VPC definitions in the input map
  network_name                           = each.value.shared_vpc_name                        // Name of the VPC network to create (e.g., "vpc-shared-core")
  project_id                             = each.value.project_id                             // GCP project ID where the VPC and subnets will be created
  delete_default_internet_gateway_routes = each.value.delete_default_internet_gateway_routes // If true, removes the default route to the internet through the default gateway
  subnets                                = each.value.subnets                                // List of subnets to create under this VPC Each subnet map should define: name, region, CIDR range, and optional fields like `description` or `private_ip_google_access`
  secondary_ranges                       = each.value.secondary_ranges                       // Optional secondary IP ranges for each subnet (commonly used in GKE) // Format: map of subnet_name => list of { range_name, ip_cidr_range }
}
