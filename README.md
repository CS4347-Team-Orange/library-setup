# CS4347 Project

We're building a library catalog on Postgres.  The application must be written in java.

# Features

* Inventory Management for books
* User Management for authorized users of the library
* Fine management - If a checked out book is overdue, we can assess and track fines for the users

# Requirements

* Use a GUI
* Use forms to manipulate data in the DB

# Run the project

Install [docker-compose](https://docs.docker.com/compose/install/)

Run the entire stack locally: `docker-compose up`

**WARNING**: The default configuration has no persistence.  Data will be destroyed when the container is stopped or removed.  The default configuration will seed sample data to assist demoing the app. 

# The stack (Tentative)

* DB: Postgres 13
* Backend API: Java + Spring or Node + Express? or Python + Django or Python + Flask?
* Frontend: VueJS 3 + Node 14
