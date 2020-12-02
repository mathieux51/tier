.DEFAULT_GOAL := help
.PHONY: help run build test docker-login docker-build docker-push

help: ##Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//' | awk -F ":" '{ printf "%-20s %s\n", $$1, $$2 }'

run: ##Run the tool.
	cargo run

build: ##Build the tool.
	cargo build --release

test: ##Test the tool.
	cargo test

docker-login: ##Login to remote docker registry.
	@echo "${DOCKER_PASSWORD}" | docker login -u ${DOCKER_USERNAME} --password-stdin ${DOCKER_REGISTRY}

docker-build: ##Build tool docker image.
	docker build -t ${DOCKER_USERNAME}/tool .

docker-push: ##Push docker image to registry.
	docker tag ${DOCKER_USERNAME}/tool ${DOCKER_USERNAME}/tool:latest
	docker push ${DOCKER_USERNAME}/tool
