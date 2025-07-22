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

///////////////////////////////////////////////////////////////////////////////
// MODULE: Service Account Creation
// PURPOSE: Creates one or more GCP Service Accounts with custom IAM bindings
///////////////////////////////////////////////////////////////////////////////

module "service_accounts" {
  source        = "terraform-google-modules/service-accounts/google"
  version       = "4.5.4"                                                                        // Source path to custom or community module
  for_each      = { for account in var.service_accounts_list : account.display_name => account } // Create one module instance per service account config
  project_id    = each.value.project_id                                                          // Target project ID
  prefix        = each.value.prefix                                                              // Optional prefix to be used with service account names
  display_name  = each.value.display_name                                                        // Friendly display name for the service account
  names         = each.value.names                                                               // List of service account names to be created
  project_roles = each.value.project_roles                                                       // Roles to bind at the project level for each service account
}

