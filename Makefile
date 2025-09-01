.PHONY: setup, check, test, package, lock

setup:
	@echo "# Setting Up Python"
	brew install pyenv
	pyenv install --skip-existing
	
	@echo "# Setting Up Monorepo Tooling"
	curl --proto '=https' --tlsv1.2 -fsSL https://static.pantsbuild.org/setup/get-pants.sh | bash

	@echo "#Setting Up Git Hooks"
	./scripts/install-hooks.sh

check:
	pants fix lint ::

test:
	pants test ::

package:
	pants package ::

lock:
	pants generate-lockfiles
