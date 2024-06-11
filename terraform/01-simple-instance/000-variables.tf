# Each of these variables should be updated to reflect your environment.

#### GLANCE
variable "image" {
  type    = string
  default = "Ubuntu 22.04 LTS (Jammy)"
}

#### NEUTRON
variable "external_network" {
  type    = string
  default = "PUBLICNET"
}

# UUID of external gateway
variable "external_gateway" {
  type    = string
  default = "1692d064-d011-4589-a39d-0e64b15e88da"
}

variable "dns_ip" {
  type    = list(string)
  default = ["8.8.8.8", "8.8.8.4"]
}

#### VM parameters
variable "flavor_http" {
  type    = string
  default = "m1.small"
}

variable "network01-lab01" {
  type = map(string)
  default = {
    subnet_name = "subnet01-lab01"
    cidr        = "192.168.1.0/24"
  }
}
