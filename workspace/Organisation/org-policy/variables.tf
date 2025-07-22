variable "org-policy" {
  description = <<EOT
List of organization policy configurations. Each object must have:
  - constraint        : Constraint to be applied (e.g., 'constraints/compute.requireOsLogin')
  - policy_type       : Type of policy ('boolean', 'list', or 'restore')
  - policy_for        : Target level ('organization', 'folder', or 'project')
  - organization_id   : Organization ID (if applicable)
  - folder_id         : Folder ID (if applicable)
  - project_id        : Project ID (if applicable)
  - enforce           : (bool) Enforce boolean constraint
  - allow             : (list) Allowed values for list constraints
  - allow_list_length : (number) Optional validation on list size
  - exclude_folders   : (set) Folders to exclude from policy
  - exclude_projects  : (set) Projects to exclude from policy
EOT

  type = list(object({
    constraint        = string
    policy_type       = string
    policy_for        = string
    organization_id   = string
    folder_id         = string
    project_id        = string
    enforce           = bool
    allow             = list(string)
    allow_list_length = number
    exclude_folders   = set(string)
    exclude_projects  = set(string)
  }))
  default = []
}

