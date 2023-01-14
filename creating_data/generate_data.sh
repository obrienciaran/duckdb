#!/bin/bash

hexdump -v -e '5/1 "%02x""\n"' /dev/urandom |
  awk -v OFS=',' '
    NR == 1 { print "employee", "department", "salary" }
    { print substr($0, 1, 8), substr($0, 9, 2), int(NR * rand()) }' |
  head -n "$1" > data.csv
