.PHONY: provision
provision:
	vagrant up --parallel

.PHONY: teardown
teardown:
	vagrant destroy -f --parallel

.PHONY: halt
halt:
	vagrant halt

.PHONY: play
play:
	ansible-playbook -i inventory.hosts playbook.yml

.PHONY: template
template:
	jsonnet -S -m . inventory-make.jsonnet
