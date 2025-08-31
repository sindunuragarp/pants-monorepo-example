.PHONY: setup, check, test, package, lock

setup:
	curl --proto '=https' --tlsv1.2 -fsSL https://static.pantsbuild.org/setup/get-pants.sh | bash
	./scripts/install-hooks.sh

check:
	pants fix lint ::

test:
	pants test ::

package:
	pants package ::

lock:
	pants generate-lockfiles
