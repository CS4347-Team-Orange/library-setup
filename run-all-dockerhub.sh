#!/usr/bin/env bash

docker pull alex4108/library-frontend
docker pull alex4108/library-backend
docker pull alex4108/library-db
docker-compose up --renew-anon-volumes
