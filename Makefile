SHELL:=/bin/bash

.PHONY: install
install: ## make install [roles_path=roles/] # Install roles dependencies
	@ansible-galaxy install --ignore-errors --roles-path="roles/" --role-file="requirements.yaml" $(opts)

.PHONY: run
run: ## make run [playbook=setup] [env=hosts] [tag=<ansible tag>] [limit=<ansible host limit>] [args=<ansible-playbook arguments>] # Run a playbook
	@env=$(env) ansible-playbook --inventory-file="hosts.yaml" --tags="$(tag)" --diff $(opts) playbook.yaml

.PHONY: bootstrap
bootstrap:
	sudo dnf update && \
	sudo dnf install -y ansible-core

.PHONY: ssh
ssh:
	@ssh -l fedora 10.0.79.113
