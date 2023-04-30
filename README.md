Job Vacancy Application
=======================

[![pipeline status](https://gitlab.com/fiuba-memo2/jobvacancy/badges/master/pipeline.svg)](https://gitlab.com/fiuba-memo2/jobvacancy/-/commits/master)

This is a typical web application (Ruby) with a relational database (PostgreSQL).
It is built on Padrino (web framework) and Sequel (database access framework).

There are several development setup options to work on this application but the recommended one is Docker Compose. 

## Docker Compose setup

A Docker compose setup is provided with the project, to use it you just need to have Docker Compose  installed. With that in place, just execute _start_dev.sh_. This will spin up 2 Postgres instances (one for running the application and another one for running the automated tests) and a ruby container to work inside. After spinning up the containers, the script with log you in in the ruby development container.

## Working with the application

1. Run **_bundle install --without staging production_**, to install all application dependencies
2. Run **_RACK_ENV=test bundle exec rake_**, to run all tests and ensure everything is properly setup
3. Run **_RACK_ENV=development bundle exec rake db:migrate db:seed_**, to setup the development database
4. Run **_bundle exec padrino start -p 3000 -h 0.0.0.0_**, to start the application

For authenticating as an offerer you can use the credentials offerer@test.com / Passw0rd!


## Additional information

In this section you can find setup information in case you don't want to use the Docker Compose setup.

### PostgreSQL setup

Follow these steps to initialize the PostgreSQL databases:

1. Install PostgreSQL if needed. On Ubuntu you can do this by running:
`sudo apt-get install -y postgresql postgresql-contrib libpq-dev`
1. Create development and test databases by running:
`sudo -u postgres psql --dbname=postgres -f ./create_dev_and_test_dbs.sql`
