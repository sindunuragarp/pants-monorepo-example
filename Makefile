.PHONY: setup
setup:
	curl --proto '=https' --tlsv1.2 -fsSL https://static.pantsbuild.org/setup/get-pants.sh | bash

.PHONY: check
check:
	pants fmt lint ::

.PHONY: test
test:
	pants test ::
