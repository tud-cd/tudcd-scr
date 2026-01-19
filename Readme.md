# LaTeX Klassen für das Corporate Design der Technischen Universität Dresden

> [!CAUTION]
> Diese Klassen sind noch in einem Entwicklungsstadium! Es können daher beim Updaten auf neuere Versionen Inkompatibilitäten entstehen!

## Wie verwende ich diese Klassen?

### Lokale Installation

1. Wenden Sie im Verzeichnis `source` den Befehl `latex tudcd.ins` an.
   Auf der Konsole sollte unter anderem die Zeile
   ```
   Generating file(s) ./tudcdartcl.cls ./tudcdreprt.cls ./tudcdbook.cls ./tudcddoc.cls ./tudcdcolor.sty ./tudcdfonts.sty
   ```
   erscheinen.
2. Wenn nicht geschehen, setzen der `TEXMFHOME` Variable. Hilfe und weiterführende Links hierzu finden Sie unter
   * [TeXLive Installationen](https://tex.stackexchange.com/q/1137)
   * [MikTeX Installationen](https://tex.stackexchange.com/a/2066/272825)
   * MacTeX Installationen: Hierzu habe ich keine Informationen gefunden, bei
3. Erstellen des Verzeichnisses `TEXMFHOME/tex/latex/tudcd`
4. Kopieren von
   ```
   tudcdartcl.cls
   tudcdreprt.cls
   tudcdbook.cls
   tudcddoc.cls
   tudcdcolor.sty
   tudcdfonts.sty
   ```
   in das Verzeichnis `TEXMFHOME/tex/latex/tudcd`
5. Kopieren des Ordners `source/logo` nach `TEXMFHOME/tex/latex/tudcd/logo`
6. Jetzt sollten Sie in der Lage sein, die Klassen zu verwenden.

Für Linux Nutzer gibt es das Installationsskript `./install-texlive-linux.bash`, welches nach Sichtung die
eben beschriebenen Schritte übernimmt.

### Nutzung in Overleaf

Um eine Nutzung der aktuellsten Version auf Overleaf/ShareLaTeX zu ermöglichen, stehen herunterladbare `.zip`
im Release Bereich bereit.

## Beispieldateien

Beispieldateien befinden sich innerhalb des `examples` Verzeichnisses.

<!--
```bash
# Wechseln in das source Verzeichnis
cd source

# "Bauen" der Klassen mittels des Docstrip Driver Files
latex tudcd.ins

# Bestimmen des Nutzer-Texmf Pfades über kpsewhich
TEXMF=$(kpsewhich -var-value TEXMFHOME)

# Erstellen des Verzeichnisses
mkdir "$TEXMF/tex/latex/tudcd"

for file in *; do
  fileextension=${file##*.}
  filename=${file%.*}
  mv "$TEXMF/tex/latex/tudcd"
  if [[ -f $file && ($fileextension == "cls") && ($fileextension == "sty") ]]; then
    echo $file
    echo "$TEXMF/tex/latex/tudcd/$file"
  fi
# Verschieben der Dateien
done
``` -->
