#!/bin/#!/usr/bin/env bash

# A script to count the number of bases in a primer
# it expects any number of fasta files as input
# it will be wrong if the last line of sequence info does not have a newline character


# expecting a fasta file formated liek this:

# > sequence_id
#AGCTCGCT

# this will get the second line (the bases) in the file
# that's the head piped into tail
# then count the charaters (the wc -m)
# but then also subtract one because wc -m counts newlines!
# Another solution would be to use tr like so
# head -2 primer_B.fasta | tail -1 | tr -d '\n' | wc -m
for file in "$@"
do
  FILENAME=$(baseman "$file" .fasta)
  COUNT=$(head -2 "$file" | tail -1 | tr -d '\n' | wc -m | tr -d " ")
  echo In "$FILENAME", there are "$COUNT" nucleotides.
done
