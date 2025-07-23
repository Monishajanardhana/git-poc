variable "organizations" {
  type        = list(string)
  default     = []
  description = "List of organization IDs where IAM bindings should be applied."
}

variable "mode" {
  type        = string
  default     = "additive"
  description = "IAM binding mode. 'additive' adds members, 'authoritative' replaces existing bindings."
}

variable "bindings" {
  type        = map(list(string))
  default     = {}
  description = "IAM bindings in the format: role => list of members. Example: roles/viewer => [\"user:abc@example.com\"]"
}

variable "conditional_bindings" {
  type = list(object({
    role        = string
    title       = string
    description = string
    expression  = string
    members     = list(string)
  }))
  default     = []
  description = <<EOT
List of conditional IAM bindings. Each object must include:
  - role        : IAM role to bind
  - title       : Title of the condition
  - description : Description of the condition
  - expression  : CEL expression (Common Expression Language) used to evaluate the condition
  - members     : List of members to apply condition to
EOT
}

