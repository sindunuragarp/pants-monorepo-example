.PHONY: setup, check, test, lock

setup:
	curl --proto '=https' --tlsv1.2 -fsSL https://static.pantsbuild.org/setup/get-pants.sh | bash

check:
	pants fmt lint ::

test:
	pants test ::

lock:
	pants generate-lockfiles
