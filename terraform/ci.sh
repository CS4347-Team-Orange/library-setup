#!/usr/bin/env bash

set -eou pipefail

if [[ "${TRAVIS_PULL_REQUEST}" == "false" && "${TRAVIS_BRANCH}" == "develop" ]]; then
    stage="develop"
    vpc_prefix="10.99"
elif [[ "${TRAVIS_PULL_REQUEST}" == "false" && "${TRAVIS_BRANCH}" == "master" ]]; then
    stage="live"
    vpc_prefix="10.100"
else
    echo "We only make deployments related to master or develop, for now."
    exit 0
fi

TF_WORKSPACE="library-${stage}"

mkdir -p ~/.terraform.d/
echo "{\"credentials\": {\"app.terraform.io\": {\"token\": \"$TF_API_TOKEN\"}}}" > ~/.terraform.d/credentials.tfrc.json

echo "stage = \"${stage}\"\nvpc_prefix = \"${vpc_prefix}\"" > ./ci.auto.tfvars

cp config.remote.tfbackend.cpl config.remote.tfbackend
sed -i "s#TF_ORG#${TF_ORG}#g"
sed -i "s#TF_WORKSPACE#${TF_WORKSPACE}#g"
sed -i "s#TF_HOST#${TF_HOST}#g"

terraform init -backend-config="config.remote.tfbackend"
terraform plan
terraform apply -auto-approve