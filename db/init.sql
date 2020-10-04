CREATE SCHEMA extensions;
GRANT USAGE ON SCHEMA extensions TO PUBLIC;
ALTER DEFAULT PRIVILEGES IN SCHEMA extensions GRANT EXECUTE ON FUNCTIONS TO PUBLIC;
ALTER DATABASE postgres SET SEARCH_PATH TO "$user",public,extensions;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp"     with schema extensions;
CREATE EXTENSION IF NOT EXISTS "fuzzystrmatch" with schema extensions;

CREATE USER   semarchy_repository WITH PASSWORD 'semarchy_repository';
CREATE SCHEMA semarchy_repository AUTHORIZATION semarchy_repository;
GRANT USAGE ON SCHEMA semarchy_repository TO public;

CREATE USER   semarchy_product_retail_mdm WITH PASSWORD 'semarchy_product_retail_mdm';
CREATE SCHEMA semarchy_product_retail_mdm AUTHORIZATION semarchy_product_retail_mdm;
GRANT USAGE ON SCHEMA semarchy_product_retail_mdm TO public;

CREATE USER   semarchy_customer_b2c_mdm WITH PASSWORD 'semarchy_customer_b2c_mdm';
CREATE SCHEMA semarchy_customer_b2c_mdm AUTHORIZATION semarchy_customer_b2c_mdm;
GRANT USAGE ON SCHEMA semarchy_customer_b2c_mdm TO public;

CREATE USER   semarchy_emp_tutorial WITH PASSWORD 'semarchy_emp_tutorial';
CREATE SCHEMA semarchy_emp_tutorial AUTHORIZATION semarchy_emp_tutorial;
GRANT USAGE ON SCHEMA semarchy_emp_tutorial TO public;

CREATE USER   semarchy_b2b_tutorial WITH PASSWORD 'semarchy_b2b_tutorial';
CREATE SCHEMA semarchy_b2b_tutorial AUTHORIZATION semarchy_b2b_tutorial;
GRANT USAGE ON SCHEMA semarchy_b2b_tutorial TO public;

CREATE USER   semarchy_stg WITH PASSWORD 'semarchy_stg';
CREATE SCHEMA semarchy_stg AUTHORIZATION semarchy_stg;
GRANT USAGE ON SCHEMA semarchy_stg TO public;

ALTER DEFAULT PRIVILEGES FOR USER semarchy_repository IN SCHEMA semarchy_repository GRANT SELECT ON TABLES TO public;