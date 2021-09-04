#!/bin/bash
echo -n "Set up ClickHouse password: "
read -s password
set -o verbose -o errexit

yc managed-clickhouse cluster create \
    --name clickhouse-dwh \
    --network-name default \
    --host type=clickhouse,zone-id=ru-central1-a,subnet-name=default-ru-central1-a,assign-public-ip \
    --user name=dbt,password="$password" \
    --database name=dbt \
    --clickhouse-resource-preset s2.micro \
    --clickhouse-disk-type network-ssd \
    --clickhouse-disk-size 100

yc managed-clickhouse user grant-permission dbt \
    --cluster-name clickhouse-dwh \
    --database dbt
