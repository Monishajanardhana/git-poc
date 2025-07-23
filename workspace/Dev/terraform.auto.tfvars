# >>> vpc >>>
vpc_list = {
  testt = {
    shared_vpc_name                        = "testt"
    project_id                             = "34567"
    delete_default_internet_gateway_routes = true
    subnets = [
      {
        subnet_name           = "test"
        subnet_ip             = "0.0.0.0/0"
        subnet_region         = "us-central"
        subnet_private_access = "yes"
        subnet_flow_logs      = "yes"
        description           = "test"
      },
    ]
  }

}
# <<< vpc <<<

# >>> firewall >>>
# --- firewall_rules ---

firewall_rules_list = {
  test-firewall = {
    network_name = "testnetwrk"
    project_id   = "wert34567"
    rules = [
    ]
  },
}
# <<< firewall <<<

# >>> service_accounts >>>
service_accounts_list = [
  {
    project_id    = ""
    prefix        = ""
    display_name  = ""
    names         = []
    project_roles = []
  }
]
# <<< service_accounts <<<

# >>> routes >>>
routes_list = {
}
# <<< routes <<<

# >>> cloud_dns >>>
dns_network = "test"
dns_project_id = "dnstestprj"

cloud_dns = [
  {
    type = "new"
    name = "test-dns"
    domain = "newtestdomain"
    recordsets = [
      {
        name = "testrecord"
        type = "CNAME"
        ttl = asdfghj
        records = ["rrdatas"]
      },
    ]
  },
]
# <<< cloud_dns <<<
