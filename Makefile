# SETUP

.PHONY: setup.mac
setup.mac:
	@echo "# Setting Up Runtime"
	brew install pyenv act
	pyenv install --skip-existing

	@echo "# Setting Up Monorepo Tooling"
	curl --proto '=https' --tlsv1.2 -fsSL https://static.pantsbuild.org/setup/get-pants.sh | bash

	@echo "#Setting Up Git Hooks"
	./tools/scripts/install-hooks.sh

# PROJECT

.PHONY: check
check:
	pants \
		tailor --check \
		lint ::

.PHONY: check.changed.ci
check.changed.ci:
	pants \
		tailor --check \
		lint --changed-since=origin/main

.PHONY: check.fix
check.fix:
	pants \
		tailor --check \
		fix lint ::

.PHONY: test
test:
	pants test ::

.PHONY: test.changed.ci
test.changed.ci:
	pants \
		test --changed-since=origin/main

.PHONY: package
package:
	pants package ::

.PHONY: package.changed.ci
package.changed.ci:
	pants \
		package --changed-since=origin/main

.PHONY: lock
lock:
	pants generate-lockfiles

# CI

.PHONY: manage-cache
manage-cache:
	./tools/scripts/manage-cache-size.sh

# LOCAL CI

.PHONY: local.ci.run
local.ci.run:
	act push

.PHONY: local.ci.run.pr
local.ci.run.pr:
	act pull_request
