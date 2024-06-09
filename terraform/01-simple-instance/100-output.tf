output "floating_ip" {
  value       = openstack_networking_floatingip_v2.float01-port01-vm01-lab01.address
}

output "ssh_keypair" {
 sensitive = true
 value = openstack_compute_keypair_v2.demo_key
}
