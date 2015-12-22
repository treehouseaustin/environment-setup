all_dirs = $(shell echo "roles/$(role)/{defaults,files,handlers,library,meta,tasks,templates,vars}")
main_dirs = $(shell echo "roles/$(role)/{defaults,handlers,meta,tasks,vars}")

all: setup provision

basic:
	ansible-playbook mac-osx.yml --ask-sudo-pass

setup:
	@echo "-----> Running setup script"
	# @sh ./scripts/setup.sh

provision:
	@echo "-----> Running ansible playbook to provision system..."
	@time ansible-playbook mac-osx.yml --diff --ask-sudo-pass

role:
	@if [ "$($@)" = "" ]; then echo "Role is not defined. Pass role=rolename"; exit 1; fi
	@mkdir -p $(all_dirs)
	@touch $(main_dirs)/main.yml
	@for dirname in defaults handlers meta tasks vars; do \
		echo "---\n# $(role) $$dirname\n" > ./roles/$(role)/$$dirname/main.yml ;\
	done

.PHONY: all, role, setup, provision
