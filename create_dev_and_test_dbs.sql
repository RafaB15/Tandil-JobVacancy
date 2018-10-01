CREATE ROLE jobvacancy WITH LOGIN PASSWORD 'jobvacancy'  CREATEDB;

CREATE DATABASE jobvacancy_development;
CREATE DATABASE jobvacancy_test;

GRANT ALL PRIVILEGES ON DATABASE "jobvacancy_development" to jobvacancy;
GRANT ALL PRIVILEGES ON DATABASE "jobvacancy_test" to jobvacancy;
