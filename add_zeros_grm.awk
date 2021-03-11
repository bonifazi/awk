#!/bin/awk -f
# Description: give a grm with format: animal_i animal_j grm_relationship with only zero grm_relationships, add zeros grm combinations
# Usage:  awk -f add_zeros_grm.awk without_zeros.grm > output_with_zeros.grm

BEGIN{max_ID=0} {grm[$1][$2]=$3; max_ID++} END {
for (i=1; i<= max_ID; i++) {
  for (j=1; j<= max_ID; j++) {
    if (i >= j && j in grm[i]) printf "%s %s %s\n", i, j, grm[i][j];
    else printf "%s %s %s \n", i, j, "0.0000000000"}}}
