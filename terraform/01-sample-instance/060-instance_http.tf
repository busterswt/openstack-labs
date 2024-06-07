#### INSTANCE HTTP ####
#
# Create instance
#

#data "templatefile" "user_data" {
#  template = file("scripts/install_webserver.yaml")
#}

resource "openstack_compute_instance_v2" "http" {
  name        = "web01"
  image_name  = var.image
  flavor_name = var.flavor_http
  key_pair    = openstack_compute_keypair_v2.demo_key.name
  user_data   = templatefile("scripts/install_webserver.yaml", {})
  network {
    port = openstack_networking_port_v2.http.id
  }
}

# Create network port
resource "openstack_networking_port_v2" "http" {
  name           = "port-instance-http"
  network_id     = openstack_networking_network_v2.generic.id
  admin_state_up = true
  security_group_ids = [
    openstack_networking_secgroup_v2.management.id,
    openstack_networking_secgroup_v2.web_ports.id,
  ]
  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.http.id
  }
}

# Create floating IP for the load balancer VIP
resource "openstack_networking_floatingip_v2" "floatip" {
  pool           = var.external_network
  port_id        = openstack_networking_port_v2.http.id
}
