Job Vacancy Application
=======================

[![build status](https://gitlab.com/fiuba-memo2/jobvacancy/badges/master/build.svg)](https://gitlab.com/fiuba-memo2/jobvacancy/commits/master)

## PostgreSQL setup

Follow these steps to initialize the PostgreSQL databases:

1. Install PostgreSQL if needed. On Ubuntu you can do this by running:
`sudo apt-get install -y postgresql-9.5 postgresql-contrib postgresql-server-dev-9.5`
1. Create development and test databases by running:
`sudo -u postgres psql --dbname=postgres -f ./create_dev_and_test_dbs.sql`

## Padrino application setup

1. Run **_bundle install --without staging production_**, to install all application dependencies
1. Run **_RACK_ENV=test bundle exec rake_**, to run all tests and ensure everything is properly setup
1. Run **_RACK_ENV=development bundle exec rake db:migrate db:seed_**, to setup the development database
1. Run **_bundle exec padrino start -h 0.0.0.0_**, to start the application

For authenticating as an offerer you can use the credentials offerer@test.com / Passw0rd!

## Some conventions to work on it:

* Follow existing coding conventions
* Use feature branch
* Add descriptive commits messages in English to every commit
* Write code and comments in English
* Use REST routes

## Pair/Mob Programming

If you are practicing Pair/Mob Programming and want to switch driver without running CI, then use "[driver-switch]" as your exact commit message.


## Using Docker-compose for development

```
$ docker-compose run --rm webapp bundle exec rake db:migrate
$ docker-compose up -d
$ docker-compose exec webapp /bin/bash
```
