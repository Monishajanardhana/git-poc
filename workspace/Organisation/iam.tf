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
// Organization IAM Bindings Module
///////////////////////////////////////////////////////////
// This module manages IAM bindings at the organization level.
// It supports authoritative or additive IAM modes and can handle
// multiple role-member mappings via the `bindings` variable.

module "organization-iam-bindings" {
  source        = "terraform-google-modules/iam/google//modules/organizations_iam" // Source path to the IAM org-level module
  version       = "7.7.1"                                                          // Specific module version to ensure compatibility and consistency
  organizations = var.organizations                                                // List of organization IDs to which IAM bindings should be applied
  mode          = var.mode                                                         // Mode of IAM binding: "additive" or "authoritative"
  bindings      = var.bindings                                                     // Map of role => list of members (e.g., roles/viewer => [user:abc@example.com])
}
