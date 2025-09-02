.PHONY: check
check:
	pants \
		tailor --check \
		update-build-files --check \
		lint ::

.PHONY: check.fix
check.fix:
	pants \
		tailor --check \
		fix lint ::

.PHONY: test
test:
	pants test ::

.PHONY: package
package:
	pants package ::

.PHONY: run
run:
	pants run main.py
