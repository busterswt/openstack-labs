#### NETWORK CONFIGURATION ####

# Router creation
resource "openstack_networking_router_v2" "router01-lab01" {
  name                = "router01-lab01"
  external_network_id = var.external_gateway
}

# Network creation
resource "openstack_networking_network_v2" "network01-lab01" {
  name = "network-lab01"
}

#### HTTP SUBNET ####

# Subnet http configuration
resource "openstack_networking_subnet_v2" "subnet01-lab01" {
  name            = var.network01-lab01["subnet_name"]
  network_id      = openstack_networking_network_v2.network01-lab01.id
  cidr            = var.network01-lab01["cidr"]
  dns_nameservers = var.dns_ip
}

# Router interface configuration
resource "openstack_networking_router_interface_v2" "http" {
  router_id = openstack_networking_router_v2.router01-lab01.id
  subnet_id = openstack_networking_subnet_v2.subnet01-lab01.id
}

