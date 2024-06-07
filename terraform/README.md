# Terraform

The enclosed examples use Terraform to create and destroy resources against an OpenStack cloud.

To use these scripts, you'll need the following:

- clouds.yaml

### Create/modify clouds.yaml

Create or modify `~/.config/openstack/clouds.yaml` to include an entry against your OpenStack cloud. This example
uses a cloud named `demo-ord1`:

```
cache:
  auth: true
clouds:
  demo-ord1:
    auth:
      auth_url: https://<identity endpoint>/v3
      username: "<username>"
      password: "<password>"
      project_id: <project_uuid>
      project_name: "<project_name>"
      user_domain_name: "<domain_name>"
    region_name: "<region>"
    interface: "public"
    identity_api_version: 3
```

In a given Terraform example, modify the `openstack` provider in `providers.tf` to reference the respective cloud:

```
provider "openstack" {
  cloud = "demo-ord1"
  region = "<region>"
  insecure = <true/false>
}
```
