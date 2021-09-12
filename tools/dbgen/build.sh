#!/bin/bash
set -o verbose -o errexit

git clone https://github.com/vadimtk/ssb-dbgen.git
cd ssb-dbgen
make