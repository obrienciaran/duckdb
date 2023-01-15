#!/bin/bash

# extracts from /dev/urandom sequences of five bytes and formats then as hexadecimal strings,
hexdump -v -e '5/1 "%02x""\n"' /dev/urandom |

# formats the lines appropriately while adding a field that is the equivalent of $(($i * $RANDOM)) and a header line, and
  awk -v OFS=',' '
    NR == 1 { print "employee", "department", "salary" }
    { print substr($0, 1, 8), substr($0, 9, 2), int(NR * rand()) }' |
    
# takes the first $1 lines of this. When head quits, the pipe to awk is closed, awk quits, the pipe to hexdump is closed, and hexdump quits, 
# so this makes the whole thing end at the right time.
  head -n "$1" > data.csv
