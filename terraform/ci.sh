#!/usr/bin/env bash

set -eou pipefail

if [[ "${TRAVIS_PULL_REQUEST}" == "true" && "${TRAVIS_BRANCH}" == "master" ]]; then
    stage="dev"
elif [[ "${TRAVIS_PULL_REQUEST}" == "false" && "${TRAVIS_BRANCH}" == "master" ]]; then
    stage="live"
else
    echo "We only make deployments related to master, for now."
    exit 0
fi

mkdir -p ~/.terraform.d/
echo "{\"credentials\": {\"app.terraform.io\": {\"token\": \"$TF_API_TOKEN\"}}}" > ~/.terraform.d/credentials.tfrc.json

echo "stage = \"${stage}\"" > ./ci.auto.tfvars

cp config.remote.tfbackend.cpl config.remote.tfbackend
sed -i "s#TF_ORG#${TF_ORG}#g"
sed -i "s#TF_WORKSPACE#${TF_WORKSPACE}#g"
sed -i "s#TF_HOST#${TF_HOST}#g"

terraform init -backend-config="config.remote.tfbackend"
terraform plan
terraform apply -auto-approve