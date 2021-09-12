#!/bin/bash
set -o verbose

aws --endpoint-url=https://storage.yandexcloud.net s3 sync ssb-dbgen s3://dwh-cloud/dbgen/ \
	--exclude=* \
	--include=*.tbl \
	--acl=public-read