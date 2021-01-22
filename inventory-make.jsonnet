local range = [0,1,2,3,4,5];

local mapped = std.map(function(i)
    "node_" + i + " ansible_port=220" + i + " ansible_ssh_private_key_file='./.vagrant/machines/node-" + i + "/virtualbox/private_key'"
    , range);

local rendered = std.join("\n", mapped);

{
  'inventory.hosts': |||
    [vagrants]
    %(hosts)s

    [vagrants:vars]
    # that's how it works with Vagrant
    ansible_host=127.0.0.1
    ansible_ssh_user='vagrant'
  ||| % {hosts: rendered},
}
