#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

export DOCKER_CONFIG=$(echo "{\"auths\":{\"${DOCKER_REGISTRY}\":{\"username\":\"${DOCKER_USERNAME}\",\"password\":\"${DOCKER_PASSWORD}\",\"email\":\"${DOCKER_EMAIL}\",\"auth\":\"$(echo "${DOCKER_USERNAME}:${DOCKER_PASSWORD}" | base64)\"}}}" | base64)

kustomize build . | envsubst '${DOCKER_CONFIG},${DOCKER_USERNAME},${AWS_DEFAULT_REGION},${AWS_ACCESS_KEY_ID},${AWS_SECRET_ACCESS_KEY}' | kubectl apply -f -
