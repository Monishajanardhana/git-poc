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

/////////////////////////////////////////////////////////////////////////////////
// MODULE: Custom Route Creation for VPC Networks
/////////////////////////////////////////////////////////////////////////////////

module "create_routes" {
  source       = "terraform-google-modules/network/google//modules/routes"
  version      = "11.1.1"
  for_each     = var.routes_list       // Iterate over each route entry in the map
  project_id   = each.value.project_id // Target project for the custom routes
  network_name = each.value.vpc_name   // VPC network name where routes will be added
  routes       = each.value.routes     // List of custom route objects
}

