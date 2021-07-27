# How to run the Library app

## For production/integration/testing environments

Ensure you have [Docker](https://www.docker.com/products/docker-desktop) and [docker-compose](https://docs.docker.com/compose/install/) installed on your system.  Ensure ports 80, 5432, and 8080 are free before trying to start the stack.  

From the `library-setup` repo, simply run `bash run-all-dockerhub.sh`  This will retrieve the latest copy of the project.

The project consists of 3 subprojects, detailed in the System Design document.  Each subproject is maintained independetly of the others.  As changes are committed to master on GitHub, the container hosted in DockerHub is automatically recreated by TravisCI.  

Once you run the `run-all-dockerhub.sh`, and you see `frontend_1` container is running, you should be able to navigate to [http://localhost](http://localhost) in the browser and use the app.

## For development

Each project maintains a README that details how to start the app for development purposes.  Start DB first, then backend, then frontend.

