# Variables
CHARTS_DIR := ./charts
CHARTS := $(wildcard $(CHARTS_DIR)/*/Chart.yaml)
LINT_CMD := helm lint
SCHEMA_CMD := helm schema-gen
PACKAGE_CMD := helm package
VERIFY_CMD := docker run --rm -v $$(pwd):/charts:z \
	quay.io/redhat-certification/chart-verifier verify

# Targets
.PHONY: all lint schema package verify-redhat

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

verify-redhat:
	@for chart in $(wildcard ./*.tgz); do \
		echo "Verifying package $$chart..."; \
		$(VERIFY_CMD) /charts/$$chart; \
	done
