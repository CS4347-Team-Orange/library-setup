#!/usr/bin/env bash

for proj in db backend frontend; do
	cd ../
	cd library-${proj}
	git pull
done
