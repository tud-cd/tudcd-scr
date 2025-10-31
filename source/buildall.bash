#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t' # Strict Internal Field Separator

SOURCE_TIME_EPOCH=$(git log -1 --pretty="format:%ct")
export SOURCE_TIME_EPOCH

# Generate all files from the .ins file to create classes and packages
latex tudcd.ins

# Then generate the documentation files
for file in *; do
  fileextension=${file##*.}
  if [[ -f $file && ($fileextension == "dtx") ]]; then
    status=$(pdflatex -interaction=nonstopmode -draftmode $file)
    echo "Status $status"
  fi
done