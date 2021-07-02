#!/usr/bin/env bash

set -e # Abort on any error 

PROJECT_NAME="" # db, backend, or frontend

# Do what you need to do to prepare for the container's build here.

# Build the container
docker build -t library/${project_name} .
