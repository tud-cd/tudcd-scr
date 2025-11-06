#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t' # Strict Internal Field Separator

for file in *; do
  fileextension=${file##*.}
  if [[ -f $file && ($fileextension != "tex" && $fileextension != "dtx" && $fileextension != "ins" && $fileextension != ".bib"  && $fileextension != "bash")]]; then
    #echo $file
    rm $file
  fi
done