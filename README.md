Job Vacancy Application
=======================

[![build status](https://gitlab.com/is-untref/jobvacancy/badges/gitlab/build.svg)](https://gitlab.com/is-untref/jobvacancy/commits/gitlab)

## PostgreSQL setup

Follow these steps to initialize the PostgreSQL databases:

1. Install PostgreSQL if needed. On Ubuntu you can do this by running:
`sudo apt-get install -y postgresql-9.3 postgresql-contrib postgresql-server-dev-9.5`
1. Create development and test databases by running:
`sudo -u postgres psql --dbname=postgres -f ./create_dev_and_test_dbs.sql`

## Padrino application setup

1. Run **_bundle install --without staging production_**, to install all application dependencies
1. Run **_bundle exec rake_**, to run all tests and ensure everything is properly setup
1. Run **_bundle exec padrino start_ -h 0.0.0.0**, to start the application

Some conventions to work on it:

* Follow existing coding conventions
* Use feature branch
* Add descriptive commits messages in English to every commit
* Write code and comments in English
* Use REST routes
