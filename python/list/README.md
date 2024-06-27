# list

Basic example of using the OpenStack SDK to print instances and related resource utilization. Requires `clouds.yaml` for authentication.

## Usage

### Non-Admin

```
(sdk) ubuntu@primary:~$ python3 list.py --os-cloud=demo-ord1 --os-region=ORD1 --all-projects
ForbiddenException: 403: Client Error for url: https://ord-ospcv2-staging.ohthree.com:8774/v2.1/servers/detail?all_tenants=True, Policy doesn't allow os_compute_api:servers:detail:get_all_tenants to be performed.
+----+---------+------------+--------+------+-----+------+---------+
| ID | Project | Hypervisor | Flavor | vCPU | RAM | Disk | Volumes |
+----+---------+------------+--------+------+-----+------+---------+
+----+---------+------------+--------+------+-----+------+---------+
(sdk) ubuntu@primary:~$ python3 list.py --os-cloud=demo-ord1 --os-region=ORD1
+--------------------------------------+----------------------------------+------------+----------+------+------+------+--------------------------------------------------------------+
|                  ID                  |             Project              | Hypervisor |  Flavor  | vCPU | RAM  | Disk |                           Volumes                            |
+--------------------------------------+----------------------------------+------------+----------+------+------+------+--------------------------------------------------------------+
| c5a30906-87b5-490e-a858-c1010d84e720 | 3c745d0256b340ac96f5ff7289218ab6 |    None    | m1.small |  2   | 2048 |  20  |                              []                              |
| 68c8d9bd-d2ab-4dc4-aa61-5979df64310a | 3c745d0256b340ac96f5ff7289218ab6 |    None    | m1.small |  2   | 2048 |  20  | [{'id': '4e73a153-863b-4e60-917a-51b39a9d697b', 'size': 20}] |
| 3be5b1b4-b80d-4b8e-8cbe-7af87958ee51 | 3c745d0256b340ac96f5ff7289218ab6 |    None    | m1.small |  2   | 2048 |  20  | [{'id': 'c87beb88-44aa-4147-95e1-7df5f3b6f0c8', 'size': 20}] |
+--------------------------------------+----------------------------------+------------+----------+------+------+------+--------------------------------------------------------------+
```
### Admin

```
(sdk) ubuntu@primary:~$ python3 list.py --os-cloud=admin-ord1 --os-region=ORD1 --all-projects
+--------------------------------------+----------------------------------+--------------------------------------+-------------------+------+------+------+--------------------------------------------------------------+
|                  ID                  |             Project              |              Hypervisor              |       Flavor      | vCPU | RAM  | Disk |                           Volumes                            |
+--------------------------------------+----------------------------------+--------------------------------------+-------------------+------+------+------+--------------------------------------------------------------+
| c5a30906-87b5-490e-a858-c1010d84e720 | 3c745d0256b340ac96f5ff7289218ab6 | 914021-ord-compute02.openstack.local |      m1.small     |  2   | 2048 |  20  |                              []                              |
| 68c8d9bd-d2ab-4dc4-aa61-5979df64310a | 3c745d0256b340ac96f5ff7289218ab6 | 914024-ord-compute05.openstack.local |      m1.small     |  2   | 2048 |  20  | [{'id': '4e73a153-863b-4e60-917a-51b39a9d697b', 'size': 20}] |
| 58e62184-5876-432e-a09b-5115b03c8343 | 189ef453dd144008b272fd564df25982 | 914023-ord-compute04.openstack.local |      m1.tiny      |  1   | 1024 |  10  | [{'id': '0fef3cd7-88c6-4bb8-b64f-f60396437633', 'size': 25}] |
| a0587a0f-6394-4619-bb8e-20e4478f8dd5 | 189ef453dd144008b272fd564df25982 | 914023-ord-compute04.openstack.local |      m1.large     |  6   | 8192 |  80  | [{'id': '73822ce9-ba34-4333-8b24-284cece9af11', 'size': 25}] |
| 6cdd2f77-467a-4d43-9b8b-5324e1a93d76 | 189ef453dd144008b272fd564df25982 | 914023-ord-compute04.openstack.local |     m1.medium     |  4   | 4096 |  40  | [{'id': '9ca6b0f7-cc32-4dfb-892a-1b44e2bead54', 'size': 25}] |
| 71ff8e6d-8399-49d9-8301-ed46137b2165 | 189ef453dd144008b272fd564df25982 | 913947-ord-compute01.openstack.local |     m1.medium     |  4   | 4096 |  40  | [{'id': '0970d207-d5c1-4b33-ad86-70ba7af3bd51', 'size': 25}] |
| f5469699-ec7b-4aed-adff-eddfe1d2cc34 | 189ef453dd144008b272fd564df25982 | 914022-ord-compute03.openstack.local |      m1.tiny      |  1   | 1024 |  10  | [{'id': '8e55baf1-e604-424e-ae5b-3964bc27dfb2', 'size': 25}] |
| 24e58636-61a3-4b5b-9c83-2f4bb50b934c | 189ef453dd144008b272fd564df25982 | 913947-ord-compute01.openstack.local | r0.compute.medium |  4   | 8192 |  0   |   [{'id': '4634fc7b-359f-490d-985e-6553685106d7', 'size':    |
|                                      |                                  |                                      |                   |      |      |      | 100}, {'id': '4634fc7b-359f-490d-985e-6553685106d7', 'size': |
|                                      |                                  |                                      |                   |      |      |      |                            100}]                             |
| e8d24222-065f-472f-8fa8-53254eb386ce | 189ef453dd144008b272fd564df25982 | 914022-ord-compute03.openstack.local |     m1.medium     |  4   | 4096 |  40  | [{'id': '67eedaac-53ff-4b64-9f31-64e9149269af', 'size': 15}, |
|                                      |                                  |                                      |                   |      |      |      | {'id': '67eedaac-53ff-4b64-9f31-64e9149269af', 'size': 15}]  |
| 3be5b1b4-b80d-4b8e-8cbe-7af87958ee51 | 3c745d0256b340ac96f5ff7289218ab6 | 914022-ord-compute03.openstack.local |      m1.small     |  2   | 2048 |  20  | [{'id': 'c87beb88-44aa-4147-95e1-7df5f3b6f0c8', 'size': 20}] |
| 2dce643a-b79a-4625-9f98-07e2cb5558b1 | e68c05ef66a54180b7198fb8af8768b1 | 914024-ord-compute05.openstack.local |       2-4-20      |  2   | 4096 |  20  | [{'id': '8e842ba5-9084-4989-87b9-7f7af59ab48f', 'size': 20}] |
+--------------------------------------+----------------------------------+--------------------------------------+-------------------+------+------+------+--------------------------------------------------------------+
(sdk) ubuntu@primary:~$ python3 list.py --os-cloud=admin-ord1 --os-region=ORD1
+--------------------------------------+----------------------------------+--------------------------------------+--------+------+------+------+--------------------------------------------------------------+
|                  ID                  |             Project              |              Hypervisor              | Flavor | vCPU | RAM  | Disk |                           Volumes                            |
+--------------------------------------+----------------------------------+--------------------------------------+--------+------+------+------+--------------------------------------------------------------+
| 2dce643a-b79a-4625-9f98-07e2cb5558b1 | e68c05ef66a54180b7198fb8af8768b1 | 914024-ord-compute05.openstack.local | 2-4-20 |  2   | 4096 |  20  | [{'id': '8e842ba5-9084-4989-87b9-7f7af59ab48f', 'size': 20}] |
+--------------------------------------+----------------------------------+--------------------------------------+--------+------+------+------+--------------------------------------------------------------+
```

### With Summary

```
(sdk) ubuntu@primary:~$ python3 list.py --os-cloud=admin-ord1 --os-region=ORD1 --all-projects --summary
+--------------------------------------+----------------------------------+--------------------------------------+-------------------+------+------+------+--------------------------------------------------------------+
|                  ID                  |             Project              |              Hypervisor              |       Flavor      | vCPU | RAM  | Disk |                           Volumes                            |
+--------------------------------------+----------------------------------+--------------------------------------+-------------------+------+------+------+--------------------------------------------------------------+
| c5a30906-87b5-490e-a858-c1010d84e720 | 3c745d0256b340ac96f5ff7289218ab6 | 914021-ord-compute02.openstack.local |      m1.small     |  2   | 2048 |  20  |                              []                              |
| 68c8d9bd-d2ab-4dc4-aa61-5979df64310a | 3c745d0256b340ac96f5ff7289218ab6 | 914024-ord-compute05.openstack.local |      m1.small     |  2   | 2048 |  20  | [{'id': '4e73a153-863b-4e60-917a-51b39a9d697b', 'size': 20}] |
| 58e62184-5876-432e-a09b-5115b03c8343 | 189ef453dd144008b272fd564df25982 | 914023-ord-compute04.openstack.local |      m1.tiny      |  1   | 1024 |  10  | [{'id': '0fef3cd7-88c6-4bb8-b64f-f60396437633', 'size': 25}] |
| a0587a0f-6394-4619-bb8e-20e4478f8dd5 | 189ef453dd144008b272fd564df25982 | 914023-ord-compute04.openstack.local |      m1.large     |  6   | 8192 |  80  | [{'id': '73822ce9-ba34-4333-8b24-284cece9af11', 'size': 25}] |
| 6cdd2f77-467a-4d43-9b8b-5324e1a93d76 | 189ef453dd144008b272fd564df25982 | 914023-ord-compute04.openstack.local |     m1.medium     |  4   | 4096 |  40  | [{'id': '9ca6b0f7-cc32-4dfb-892a-1b44e2bead54', 'size': 25}] |
| 71ff8e6d-8399-49d9-8301-ed46137b2165 | 189ef453dd144008b272fd564df25982 | 913947-ord-compute01.openstack.local |     m1.medium     |  4   | 4096 |  40  | [{'id': '0970d207-d5c1-4b33-ad86-70ba7af3bd51', 'size': 25}] |
| f5469699-ec7b-4aed-adff-eddfe1d2cc34 | 189ef453dd144008b272fd564df25982 | 914022-ord-compute03.openstack.local |      m1.tiny      |  1   | 1024 |  10  | [{'id': '8e55baf1-e604-424e-ae5b-3964bc27dfb2', 'size': 25}] |
| 24e58636-61a3-4b5b-9c83-2f4bb50b934c | 189ef453dd144008b272fd564df25982 | 913947-ord-compute01.openstack.local | r0.compute.medium |  4   | 8192 |  0   |   [{'id': '4634fc7b-359f-490d-985e-6553685106d7', 'size':    |
|                                      |                                  |                                      |                   |      |      |      | 100}, {'id': '4634fc7b-359f-490d-985e-6553685106d7', 'size': |
|                                      |                                  |                                      |                   |      |      |      |                            100}]                             |
| e8d24222-065f-472f-8fa8-53254eb386ce | 189ef453dd144008b272fd564df25982 | 914022-ord-compute03.openstack.local |     m1.medium     |  4   | 4096 |  40  | [{'id': '67eedaac-53ff-4b64-9f31-64e9149269af', 'size': 15}, |
|                                      |                                  |                                      |                   |      |      |      | {'id': '67eedaac-53ff-4b64-9f31-64e9149269af', 'size': 15}]  |
| 3be5b1b4-b80d-4b8e-8cbe-7af87958ee51 | 3c745d0256b340ac96f5ff7289218ab6 | 914022-ord-compute03.openstack.local |      m1.small     |  2   | 2048 |  20  | [{'id': 'c87beb88-44aa-4147-95e1-7df5f3b6f0c8', 'size': 20}] |
| 2dce643a-b79a-4625-9f98-07e2cb5558b1 | e68c05ef66a54180b7198fb8af8768b1 | 914024-ord-compute05.openstack.local |       2-4-20      |  2   | 4096 |  20  | [{'id': '8e842ba5-9084-4989-87b9-7f7af59ab48f', 'size': 20}] |
+--------------------------------------+----------------------------------+--------------------------------------+-------------------+------+------+------+--------------------------------------------------------------+
+-----------------+------------+----------------+-----------------+------------------------+----------------------------+
| Total Instances | Total vCPU | Total RAM (GB) | Total Disk (GB) | Total Attached Volumes | Total Volume Capacity (GB) |
+-----------------+------------+----------------+-----------------+------------------------+----------------------------+
|        11       |     32     |      40.0      |       300       |           12           |            390             |
+-----------------+------------+----------------+-----------------+------------------------+----------------------------+
```

### File Output

```
(sdk) ubuntu@primary:~$ python3 list.py --os-cloud=admin-ord1 --os-region=ORD1 --all-projects --csv
(sdk) ubuntu@primary:~$ cat output.csv
ID	Project	Hypervisor	Flavor	vCPU	RAM	Disk	Volumes
c5a30906-87b5-490e-a858-c1010d84e720	3c745d0256b340ac96f5ff7289218ab6	914021-ord-compute02.openstack.local	m1.small	2	2048	20	[]
68c8d9bd-d2ab-4dc4-aa61-5979df64310a	3c745d0256b340ac96f5ff7289218ab6	914024-ord-compute05.openstack.local	m1.small	2	2048	20	[{'id': '4e73a153-863b-4e60-917a-51b39a9d697b', 'size': 20}]
58e62184-5876-432e-a09b-5115b03c8343	189ef453dd144008b272fd564df25982	914023-ord-compute04.openstack.local	m1.tiny	1	1024	10	[{'id': '0fef3cd7-88c6-4bb8-b64f-f60396437633', 'size': 25}]
a0587a0f-6394-4619-bb8e-20e4478f8dd5	189ef453dd144008b272fd564df25982	914023-ord-compute04.openstack.local	m1.large	6	8192	80	[{'id': '73822ce9-ba34-4333-8b24-284cece9af11', 'size': 25}]
6cdd2f77-467a-4d43-9b8b-5324e1a93d76	189ef453dd144008b272fd564df25982	914023-ord-compute04.openstack.local	m1.medium	4	4096	40	[{'id': '9ca6b0f7-cc32-4dfb-892a-1b44e2bead54', 'size': 25}]
71ff8e6d-8399-49d9-8301-ed46137b2165	189ef453dd144008b272fd564df25982	913947-ord-compute01.openstack.local	m1.medium	4	4096	40	[{'id': '0970d207-d5c1-4b33-ad86-70ba7af3bd51', 'size': 25}]
f5469699-ec7b-4aed-adff-eddfe1d2cc34	189ef453dd144008b272fd564df25982	914022-ord-compute03.openstack.local	m1.tiny	1	1024	10	[{'id': '8e55baf1-e604-424e-ae5b-3964bc27dfb2', 'size': 25}]
24e58636-61a3-4b5b-9c83-2f4bb50b934c	189ef453dd144008b272fd564df25982	913947-ord-compute01.openstack.local	r0.compute.medium	4	8192	0	[{'id': '4634fc7b-359f-490d-985e-6553685106d7', 'size': 100}, {'id': '4634fc7b-359f-490d-985e-6553685106d7', 'size': 100}]
e8d24222-065f-472f-8fa8-53254eb386ce	189ef453dd144008b272fd564df25982	914022-ord-compute03.openstack.local	m1.medium	4	4096	40	[{'id': '67eedaac-53ff-4b64-9f31-64e9149269af', 'size': 15}, {'id': '67eedaac-53ff-4b64-9f31-64e9149269af', 'size': 15}]
3be5b1b4-b80d-4b8e-8cbe-7af87958ee51	3c745d0256b340ac96f5ff7289218ab6	914022-ord-compute03.openstack.local	m1.small	2	2048	20	[{'id': 'c87beb88-44aa-4147-95e1-7df5f3b6f0c8', 'size': 20}]
2dce643a-b79a-4625-9f98-07e2cb5558b1	e68c05ef66a54180b7198fb8af8768b1	914024-ord-compute05.openstack.local	2-4-20	2	4096	20	[{'id': '8e842ba5-9084-4989-87b9-7f7af59ab48f', 'size': 20}]
```
