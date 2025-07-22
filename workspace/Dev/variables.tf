variable "vpc_list" {
  description = "Map of VPCs to be created including subnet and secondary range details."
  type = map(object({
    shared_vpc_name                        = string
    project_id                             = string
    delete_default_internet_gateway_routes = bool
    subnets                                = list(map(string))
    secondary_ranges = map(list(object({
      range_name    = string
      ip_cidr_range = string
    })))
  }))
}

variable "firewall_rules_list" {
  description = "Map of firewall rules per network."
  type = map(object({
    project_id   = string
    network_name = string
    rules = list(object({
      name                    = string
      description             = string
      direction               = string
      priority                = number
      ranges                  = list(string)
      source_tags             = list(string)
      source_service_accounts = list(string)
      target_tags             = list(string)
      target_service_accounts = list(string)
      allow = list(object({
        protocol = string
        ports    = list(string)
      }))
      deny = list(object({
        protocol = string
        ports    = list(string)
      }))
      log_config = object({
        metadata = string
      })
    }))
  }))
}

variable "service_accounts_list" {
  description = <<EOT
List of service account configurations with roles and names.
EOT

  type = list(object({
    project_id    = string
    prefix        = string
    names         = list(string)
    project_roles = list(string)
    display_name  = string
  }))
  default = []
}

variable "routes_list" {
  description = <<EOT
List of custom routes to add to VPCs.
EOT

  type = list(object({
    vpc_name   = string
    project_id = string
    routes     = list(map(string))
  }))
}

variable "cloud_dns" {
  description = "List of Cloud DNS zones and their record sets."
  type = list(object({
    type   = string
    name   = string
    domain = string
    recordsets = list(object({
      name    = string
      type    = string
      ttl     = number
      records = list(string)
    }))
  }))
  default = []
}

variable "dns_project_id" {
  type        = string
  description = "Project id of the VPC"
}

variable "dns_network" {
  type        = string
  description = "vpc name for cloud dns"
}

