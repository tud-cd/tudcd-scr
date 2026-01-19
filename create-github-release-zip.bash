#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t' # Strict Internal Field Separator
# Wechseln in das source Verzeichnis
cd source

# "Bauen" der Klassen mittels des Docstrip Driver Files
latex tudcd.ins

# Bestimmen des Nutzer-Texmf Pfades über kpsewhich
TEXMF=$(kpsewhich -var-value TEXMFHOME)

# Erstellen der Verzeichnisse
if [[ ! -d "../__temp" ]]; then
  mkdir -p "../__temp"
fi
if [[ ! -d "../__temp/logo" ]]; then
  mkdir -p "../__temp/logo"
fi


for file in *; do
  fileextension=${file##*.}
  filename=${file%.*}
  #mv "$TEXMF/tex/latex/tudcd"
  if [[ -f $file && ($fileextension == "cls" || $fileextension == "sty")]]; then
    #echo $file
    echo "Moving $filename.$fileextension to __temp/$file"
    mv -f $file "../__temp/$file"
  fi
done

echo "Copying Logo Files"
cd logo
for file in *; do
  fileextension=${file##*.}
  filename=${file%.*}
  #mv "$TEXMF/tex/latex/tudcd"
  if [[ -f $file && ($fileextension == "pdf" || $fileextension == "eps") ]]; then
    echo "Copying $file to __temp/logo/$file"
    cp -f $file "../../__temp/logo/$file"
  fi
# Verschieben der Dateien
done

cd ..
cd ..

cd __temp

zip -r release .

mv release.zip ../release.zip

cd ..

rm -rf __temp