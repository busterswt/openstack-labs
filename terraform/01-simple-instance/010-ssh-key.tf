# Define ssh to config in instance

resource "openstack_compute_keypair_v2" "demo_key" {
  name = "keypair01-lab01"
}

resource "local_file" "private_key_file" {
  content = openstack_compute_keypair_v2.demo_key.private_key
  filename = "sshkey.pem"
  file_permission = "0600"
}
