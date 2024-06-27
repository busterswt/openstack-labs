# Copyright 2024, Rackspace Technology, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in witing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# REQUIREMENTS:
# PrettyTable >= 3.10.0

import argparse
import openstack
from prettytable import PrettyTable

TOTAL_SERVERS = 0
TOTAL_DISK = 0
TOTAL_VOLUME_DISK = 0
TOTAL_RAM = 0
TOTAL_VCPU = 0
TOTAL_ATTACHED_VOLUMES = 0

def get_servers(args):
  # Set some counters
  global TOTAL_SERVERS
  global TOTAL_DISK
  global TOTAL_VOLUME_DISK
  global TOTAL_RAM
  global TOTAL_VCPU
  global TOTAL_ATTACHED_VOLUMES

  try:
    for server in cloud.compute.servers(all_projects=args.all_projects):
      TOTAL_SERVERS += 1
      # Determine volume info
      volumes=[]
      volume_info={}
      for _volume in server.volumes:
        TOTAL_ATTACHED_VOLUMES += 1
        volume = cloud.block_storage.find_volume(_volume.id)
        volume_info['id'] = volume.id
        volume_info['size'] = volume.size
        TOTAL_VOLUME_DISK += volume.size
        volumes.append(volume_info)
      # Append resources to total
      TOTAL_DISK += server.flavor.disk
      TOTAL_RAM += server.flavor.ram
      TOTAL_VCPU += server.flavor.vcpus
      table.add_row(
        [
          server.id,
          server.project_id,
          server.hypervisor_hostname,
          server.flavor.name,
          server.flavor.vcpus,
          server.flavor.ram,
          server.flavor.disk,
          volumes,
        ]
      )

  except Exception as error:
      print(error)

  if args.csv:
    with open('output.csv', 'w', newline='') as f_output:
      f_output.write(table.get_csv_string(delimiter='\t'))
  else:
    print(table)

def print_summary(args):
    # Print the summary row
    summary_table.add_row(
      [
        TOTAL_SERVERS,
        TOTAL_VCPU,
        TOTAL_RAM/1024,
        TOTAL_DISK,
        TOTAL_ATTACHED_VOLUMES,
        TOTAL_VOLUME_DISK,
      ]
    )
    print(summary_table)

if __name__ == "__main__":
  parser = argparse.ArgumentParser(
        description="list.py - Utility to instance utilization"
    )

  parser.add_argument('--all-projects', action='store_true')
  parser.add_argument('--os-cloud', type=str, help="Cloud name defined in clouds.yaml", required=True, default=None)
  parser.add_argument('--os-region', type=str, help="Region name defined in clouds.yaml", required=True, default=None)
  parser.add_argument('--summary', help="Prints summary table to stdout only", action='store_true')
  parser.add_argument('--csv', help="Writes table to file using tab-delimited fields", action='store_true')
  args = parser.parse_args()

  # Initialize and turn on debug logging
  openstack.enable_logging(debug=False)

  # Initialize cloud
  cloud = openstack.connect(cloud=args.os_cloud, region_name=args.os_region)

  table = PrettyTable(
    [
      "ID",
      "Project",
      "Hypervisor",
      "Flavor",
      "vCPU",
      "RAM",
      "Disk",
      "Volumes"
    ]
  )
  table.max_width = 60

  summary_table = PrettyTable(
    [
      "Total Instances",
      "Total vCPU",
      "Total RAM (GB)",
      "Total Disk (GB)",
      "Total Attached Volumes",
      "Total Volume Capacity (GB)"
    ]
  )

  get_servers(args)
  if args.summary and not args.csv:
    print_summary(args)
