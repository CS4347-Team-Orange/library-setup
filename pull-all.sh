#!/usr/bin/env bash

for proj in db backend frontend; do
	cd ../library-${proj}
	echo "Pulling ${proj}"
	git pull
	cd ../library-setup
done
