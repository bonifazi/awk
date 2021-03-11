#!/bin/awk -f
# Description: give a grm with format: animal_i animal_j grm_relationship with only zero grm_relationships, add zeros grm combinations
# Assumptions: 1st element of last raw is the max ID number in grm.
# Usage: awk -f add_zeros_grm.awk input.grm > output.grm

{grm[$1][$2]=$3} END {
max_ID=$1
for (i=1; i<= max_ID; i++) {
  for (j=1; j<= max_ID; j++) {
    if (i >= j && j in grm[i]) printf "%s %s %s\n", i, j, grm[i][j];
    else printf "%s %s %s \n", i, j, "0.0000000000"}}}
