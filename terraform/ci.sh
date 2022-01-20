#!/usr/bin/env bash

set -eou pipefail

if [[ "${TRAVIS_PULL_REQUEST}" == "false" && "${TRAVIS_BRANCH}" == "develop" ]]; then
    stage="develop"
    vpc_prefix="10.99"
elif [[ "${TRAVIS_PULL_REQUEST}" == "false" && "${TRAVIS_BRANCH}" == "master" ]]; then
    stage="live"
    vpc_prefix="10.100"
elif [[ "${TRAVIS_PULL_REQUEST}" == "false" ]]; then
    stage="${TRAVIS_BRANCH}"
    vpc_prefix="10.101"
elif [[ "${TRAVIS_PULL_REQUEST}" == "true" ]]; then
    stage="${TRAVIS_PULL_REQUEST_BRANCH}" # The source branch
    vpc_prefix="10.101"
else 
    echo "TRAVIS_PULL_REQUEST has unexpected value: ${TRAVIS_PULL_REQUEST}"
    exit 1
fi

TF_WORKSPACE="library-${stage}"

mkdir -p ~/.terraform.d/
echo "{\"credentials\": {\"app.terraform.io\": {\"token\": \"$TF_API_TOKEN\"}}}" > ~/.terraform.d/credentials.tfrc.json

echo "stage = \"${stage}\"\nvpc_prefix = \"${vpc_prefix}\"" > ./ci.auto.tfvars

cp config.remote.tfbackend.tpl config.remote.tfbackend
sed -i "s#TF_ORG#${TF_ORG}#g"
sed -i "s#TF_WORKSPACE#${TF_WORKSPACE}#g"
sed -i "s#TF_HOST#${TF_HOST}#g"

terraform init -backend-config="config.remote.tfbackend"
terraform plan
terraform apply -auto-approve