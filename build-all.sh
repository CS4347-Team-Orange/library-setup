#!/usr/bin/env bash
set -x

origpwd=$(pwd)
projects="library-db library-frontend library-backend"
for project in projects; do
	cd ${origpwd}
	cd ../${project}
	bash build.sh
done

cd ${origpwd}
