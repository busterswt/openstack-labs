# Define ssh to config in instance

resource "openstack_compute_keypair_v2" "demo_key" {
  name = "demo-keypair"
}
