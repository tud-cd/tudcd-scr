#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t' # Strict Internal Field Separator
# Wechseln in das source Verzeichnis
cd source

# "Bauen" der Klassen mittels des Docstrip Driver Files
latex tudcd.ins

# Bestimmen des Nutzer-Texmf Pfades über kpsewhich
TEXMF=$(kpsewhich -var-value TEXMFHOME)

# Check for empty string
if [ -z "$TEXMF" ]; then
    echo "ERROR: Enviroment Variable TEXMFHOME not set or kpsewhich not on path, aborting..."
    exit
fi

# Erstellen der Verzeichnisse
if [[ ! -d "$TEXMF/tex/latex/tudcd" ]]; then
  mkdir -p "$TEXMF/tex/latex/tudcd"
fi
if [[ ! -d "$TEXMF/tex/latex/tudcd/logo" ]]; then
  mkdir -p "$TEXMF/tex/latex/tudcd/logo"
fi
if [[ ! -d "$TEXMF/tex/latex/beamerthemetudcd" ]]; then
  mkdir -p "$TEXMF/tex/latex/beamerthemetudcd"
fi


for file in *; do
  fileextension=${file##*.}
  filename=${file%.*}
  filenameprefix=${filename:0:6}
  #mv "$TEXMF/tex/latex/tudcd"
  if [[ -f $file && ($fileextension == "cls" || $fileextension == "sty") && $filenameprefix != "beamer" ]]; then
    #echo $file
    echo "Moving $filename.$fileextension to $TEXMF/tex/latex/tudcd/$file"
    mv -f $file "$TEXMF/tex/latex/tudcd/$file"
  fi
  if [[ -f $file && ($fileextension == "cls" || $fileextension == "sty") && $filenameprefix == "beamer" ]]; then
    #echo $file
    echo "Moving $filename.$fileextension to $TEXMF/tex/latex/beamerthemetudcd/$file"
    mv -f $file "$TEXMF/tex/latex/beamerthemetudcd/$file"
  fi
# Verschieben der Dateien
done

echo "Copying Logo Files"
cd logo
for file in *; do
  fileextension=${file##*.}
  filename=${file%.*}
  #mv "$TEXMF/tex/latex/tudcd"
  if [[ -f $file && ($fileextension == "pdf" || $fileextension == "eps") ]]; then
    #echo $file
    cp -f $file "$TEXMF/tex/latex/tudcd/logo/$file"
  fi
# Verschieben der Dateien
done
