.DEFAULT_GOAL := help
.PHONY: help minikube-start deploy

help: ##Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//' | awk -F ":" '{ printf "%-20s %s\n", $$1, $$2 }'

minikube-start: ##Start minikube for local deployment.
	minikube start

deploy: ##Deploy to cluster using kustomize.
	@sh scripts/deploy.sh
