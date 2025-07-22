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
// MODULE: Create Firewall Rules
///////////////////////////////////////////////////////////
// This module deploys firewall rules to a specified VPC network
// in one or more GCP projects. It iterates over a list of rule
// definitions and applies them to their respective networks.
///////////////////////////////////////////////////////////

module "create_firewall_rules" {
  source  = "terraform-google-modules/network/google//modules/firewall-rules"
  version = "11.1.1"

  for_each = var.firewall_rules_list // Keyed list of rule definitions (map of objects)

  project_id   = each.value.project_id   // GCP project where firewall rules will be created
  network_name = each.value.network_name // Name of the VPC network for applying rules
  rules        = each.value.rules        // List of firewall rule configurations
}

