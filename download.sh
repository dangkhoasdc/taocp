#!/usr/bin/env bash

for i in {7..20}; do
  for j in a b c; do
    wget "https://www-cs-faculty.stanford.edu/~knuth/fasc${i}${j}.ps.gz"
  done
done

for gz_file in *.ps.gz; do
  ps_file=${gz_file:0:-3}
  pdf_file="${ps_file:0:-3}.pdf"
  echo "Processing ${gz_file}"
  gunzip $ps_file && ps2pdf ${ps_file} ${pdf_file}
  mv ${pdf_file} ./pre-fascicles
done

# clean up
rm fasc*.ps
echo "Done !!"
