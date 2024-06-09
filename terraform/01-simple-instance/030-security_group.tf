# Access group, open input port 22,80,443

resource "openstack_networking_secgroup_v2" "web_ports" {
  name        = "web_ports"
  description = "Open port 80,443"
}

resource "openstack_networking_secgroup_v2" "management" {
  name        = "management"
  description = "Open port 22"
}

resource "openstack_networking_secgroup_rule_v2" "http_rule" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol  = "tcp"
  port_range_min = "80"
  port_range_max = "80"
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.web_ports.id
}

resource "openstack_networking_secgroup_rule_v2" "https_rule" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol  = "tcp"
  port_range_min = "443"
  port_range_max = "443"
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.web_ports.id
}

resource "openstack_networking_secgroup_rule_v2" "ssh_rule" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol  = "tcp"
  port_range_min = "22"
  port_range_max = "22"
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.management.id
}
