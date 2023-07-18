# Variables
CHARTS_DIR := ./charts
CHARTS := $(wildcard $(CHARTS_DIR)/*/Chart.yaml)
LINT_CMD := helm lint
SCHEMA_CMD := helm schema-gen
PACKAGE_CMD := helm package

# Targets
.PHONY: all lint schema package

all: lint schema package

lint:
	@for chart in $(CHARTS); do \
		echo "Linting $$(dirname $$chart)..."; \
		$(LINT_CMD) $$(dirname $$chart); \
	done

package:
	@for chart in $(CHARTS); do \
		echo "Packaging $$(dirname $$chart)..."; \
		$(PACKAGE_CMD) $$(dirname $$chart); \
	done
