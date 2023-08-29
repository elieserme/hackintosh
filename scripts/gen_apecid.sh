#!/bin/sh
# first 32 bit integer
low32=$(od -An -N4 -tu4 < /dev/urandom)
# second 32 bit integer
high32=$(od -An -N4 -tu4 < /dev/urandom)
# joining the 2 numbers
long=$(($low32 + ($high32 << 32)))
# removing leading minus sign if exists
echo $long | sed 's/-//'