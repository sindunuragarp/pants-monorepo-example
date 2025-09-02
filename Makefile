# SETUP

.PHONY: setup
setup:
	@echo "# Setting Up Python"
	brew install pyenv
	pyenv install --skip-existing
	
	@echo "# Setting Up Monorepo Tooling"
	curl --proto '=https' --tlsv1.2 -fsSL https://static.pantsbuild.org/setup/get-pants.sh | bash

	@echo "#Setting Up Git Hooks"
	./scripts/install-hooks.sh

# PROJECT

.PHONY: check
check:
	pants \
		tailor --check \
		update-build-files --check \
		lint ::

.PHONY: check.changed
check.changed:
	pants \
		tailor --check \
		update-build-files --check \
		lint --changed-since=origin/main

.PHONY: check.fix
check.fix:
	pants \
		tailor --check \
		fix lint ::

.PHONY: test
test:
	pants test ::

.PHONY: test.changed
test.changed:
	pants \
		test --changed-since=origin/main

.PHONY: package
package:
	pants package ::

.PHONY: package.changed
package.changed:
	pants \
		package --changed-since=origin/main

.PHONY: lock
lock:
	pants generate-lockfiles

# LOCAL CI

.PHONY: local.ci.setup
local.ci.setup:
	brew install act

.PHOLY: local.ci.run
local.ci.run:
	act push

.PHOLY: local.ci.run.pr
local.ci.run.pr:
	act pull_request
