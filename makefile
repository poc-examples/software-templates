SHELL := /bin/bash

YAML_FILES := $(shell find $(shell pwd)/tests/skeletons/use-cases -name '*.yaml' | sed 's|$(shell pwd)/tests/skeletons/use-cases/||')

run-tests:
	@echo -e "--- Running Skeleton Tests --- \n"
	@for file in $(YAML_FILES); do \
		echo "Running Test Case - $$file"; \
		podman run --rm -it \
			-v $(shell pwd)/tests/skeletons/use-cases:/tests/use-cases:z \
			-v $(shell pwd)/skeletons:/tests/skeletons:z \
			nunjucks-test node nunjucks-test.js $$file; \
	done

render:
	@echo -e "--- Rendering Skeletons --- \n"
	@for file in $(YAML_FILES); do \
		echo "Rendering Test Case - $$file"; \
		podman run --rm -it \
			-v $(shell pwd)/tests/skeletons/use-cases:/tests/use-cases:z \
			-v $(shell pwd)/skeletons:/tests/skeletons:z \
			nunjucks-test nunjucks-render.js $$file; \
	done