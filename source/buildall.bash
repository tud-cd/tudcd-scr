#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t' # Strict Internal Field Separator

# Make the PDFs reproducible
SOURCE_TIME_EPOCH=$(git log -1 --pretty="format:%ct")
export SOURCE_TIME_EPOCH

newline=$'\n'
hashFile="hashes.md5"
if [[ -f $hashFile ]]; then
   md5sum -c --quiet $hashFile
fi

# Generate all files from the .ins file to create classes and packages
latex tudcd.ins

md5list=""
for file in *; do
  fileextension=${file##*.}
  filename=${file%.*}
  if [[ -f $file && ($fileextension == "cls" || $fileextension == "sty")]]; then
    md5list="$md5list$file$newline" #
  fi
done
md5list="${md5list#"${md5list%%[![:space:]]*}"}" # remove trailing whitespace
md5sum $md5list > $hashFile

# Then generate the documentation files
for file in *; do
  fileextension=${file##*.}
  filename=${file%.*}
  if [[ -f $file && ($fileextension == "dtx") ]]; then
    pdflatex -interaction=nonstopmode -draftmode $file
    biber $filename
    pdflatex -interaction=nonstopmode -draftmode $file
    pdflatex -interaction=nonstopmode $file
    echo $?
    #echo "Status $status"
  fi
done