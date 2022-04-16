#!/bin/sh

curl -o /tmp/piscs.sh https://raw.githubusercontent.com/aguentepe/workconfig/main/piscs.sh
chmod +x /tmp/piscs.sh
/tmp/piscs.sh -r https://github.com/aguentepe/workconfig -p https://raw.githubusercontent.com/aguentepe/workconfig/main/progs.csv
