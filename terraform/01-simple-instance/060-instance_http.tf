#### INSTANCE HTTP ####
#
# Create instance
#

resource "openstack_compute_instance_v2" "vm01-lab01" {
  name        = "vm01-lab01"
  image_name  = var.image
  flavor_name = var.flavor_http
  key_pair    = openstack_compute_keypair_v2.demo_key.name
  user_data   = templatefile("scripts/install_webserver.yaml", {})
  network {
    port = openstack_networking_port_v2.port01-vm01-lab01.id
  }
}

# Create network port
resource "openstack_networking_port_v2" "port01-vm01-lab01" {
  name           = "port01-vm01-lab01"
  network_id     = openstack_networking_network_v2.network01-lab01.id
  admin_state_up = true
  security_group_ids = [
    openstack_networking_secgroup_v2.management.id,
    openstack_networking_secgroup_v2.web_ports.id,
  ]
  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.subnet01-lab01.id
  }
}

# Create floating IP for the VM
resource "openstack_networking_floatingip_v2" "float01-port01-vm01-lab01" {
  pool           = var.external_network
  port_id        = openstack_networking_port_v2.port01-vm01-lab01.id
}
