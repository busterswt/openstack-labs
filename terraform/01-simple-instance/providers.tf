terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "1.54.1"
    }
  }
}

# The OpenStack provider is using ~/.config/openstack/clouds.yaml.

provider "openstack" {
  cloud = "demo-ord1"
  region = "ORD1"
  insecure = true
}
