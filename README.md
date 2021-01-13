# bitnami redis cluster via Vagrant

This setup is essentially mimicking [this](https://github.com/bitnami/bitnami-docker-redis-cluster/blob/master/docker-compose.yml) by using VM stack instead of container stack (although it still uses container inside the VM)


## Prerequisites

[Vagrant](https://www.vagrantup.com/)


## Inventory
Optionally template with jsonnet by `make template`


## Get started

### Provision 6 VMs via Vagrant
`make provision`

### Run redis and configure cluster via Ansible
`make play`

## Verify cluster setup

```
vagrant ssh node-0
docker logs redis-init
```

And make sure that last few lines looks like this

```
[OK] All 16384 slots covered.
Cluster correctly created
```

Alternatively, you can compare the result with [this](https://github.com/bitnami/bitnami-docker-redis-cluster).

## Clean up

### Halt VMs
`make halt`

### Destroy
`make teardown`

## Misc
You might want this to avoid host authenticity checking on Ansible runs against local Vagrant VMs.
In that case you do `export ANSIBLE_HOST_KEY_CHECKING=false`.
See more details at https://stackoverflow.com/questions/32297456/how-to-ignore-ansible-ssh-authenticity-checking.

## Troubleshooting

### Ansible can't connect VMs
You might want to look at inventory file and `vagrant ssh-config`
