#!/usr/bin/env bash
set -x
set -e

origpwd=$(pwd)
projects="library-db library-frontend library-backend"
for project in ${projects}; do
	cd ${origpwd}
	cd ../${project}
	bash build.sh
	bash test.sh
done

cd ${origpwd}
