#!/bin/bash
set -o verbose -o errexit

cd ssb-dbgen
./dbgen -s 10 -T c
./dbgen -s 10 -T p
./dbgen -s 10 -T s
./dbgen -s 10 -T l
