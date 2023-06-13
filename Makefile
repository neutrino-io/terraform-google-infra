.PHONY: all plan apply destroy

all: help init-modules pre-commit

help: ## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

init-modules:
	@terraform -chdir=modules/service-gke-operator/ init && \
	terraform -chdir=examples/infra-basic/ init && \
	terraform -chdir=examples/infra-gke-operators/ init && \
	terraform -chdir=examples/infra-gke/ init

pre-commit: init-modules
	@pre-commit run -a
