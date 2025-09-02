# SETUP

.PHONY: setup.linux
setup.linux:
	@echo "# Setting Up Runtime"
	apt-get update && apt-get install -y \
		python3-pip \
		python3-venv \
		git \
		curl

	@echo "# Setting Up Monorepo Tooling"
	curl --proto '=https' --tlsv1.2 -fsSL https://static.pantsbuild.org/setup/get-pants.sh | bash

	@echo "# Setting Up Git Hooks"
	git init
	./tools/scripts/install-hooks.sh

.PHONY: setup.mac
setup.mac:
	@echo "# Setting Up Runtime"
	brew install pyenv act git
	pyenv install --skip-existing

	@echo "# Setting Up Monorepo Tooling"
	curl --proto '=https' --tlsv1.2 -fsSL https://static.pantsbuild.org/setup/get-pants.sh | bash

	@echo "# Setting Up Git Hooks"
	git init
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
		lint \
		--changed-since=origin/main \
		--changed-dependents=transitive

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
	pants test \
		--changed-since=origin/main \
		--changed-dependents=transitive

.PHONY: package
package:
	GIT_SHA=$(shell git rev-parse HEAD) pants package ::

.PHONY: package.changed.ci
package.changed.ci:
	GIT_SHA=$(shell git rev-parse HEAD) pants package \
		--changed-since=origin/main \
		--changed-dependents=transitive

.PHONY: publish
publish:
	GIT_SHA=$(shell git rev-parse HEAD) pants publish ::

.PHONY: publish.changed.ci
publish.changed.ci:
	GIT_SHA=$(shell git rev-parse HEAD) pants publish \
		--changed-since=origin/main \
		--changed-dependents=transitive

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
