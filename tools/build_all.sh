#!/bin/bash
set -o verbose -o errexit

dbt deps
dbt run-operation init_s3_sources
dbt run
dbt docs generate
