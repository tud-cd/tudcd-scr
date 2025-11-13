# LaTeX Klassen für das Corporate Design der Technischen Universität Dresden

> [!CAUTION]
> Diese Klassen sind noch in einem Entwicklungsstadium! Es können daher beim Updaten auf neuere Versionen Inkompatibilitäten entstehen!

## Wie verwende ich diese Klassen?

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
   mitsamt der Logodateien in das Verzeichnis `TEXMFHOME/tex/latex/tudcd`
5. Jetzt sollten Sie in der Lage sein, die Klassen zu verwenden.


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

## Featureliste

* [x] Logodateien
* [ ] Dokumentenklassen
* * [x] Seitengeometrie
* * [x] Konfigurierbarkeit der Seitengeometrie
* * [x] Einstellen der Schriftarten für LaTeX
* * [ ] Einstellen der Schriftarten für LuaLaTeX/XeLaTeX
* * [x] Einstellen der Schriftgrößen
* * [x] Hinzufügen von Titelseiten und Zitatseiten
* * [ ] Einstellungen der Schriftmerkmale für Dokumentationsbestandteile
* * [ ] Konfiguration des Logos
* * [ ] Hinzufügen von Zweitlogos
* * [ ] Beheben der Verzeichnisse
* * [ ] Listeneinzüge und Abstände
* * [ ] Leitfaden für die Benutzung der Dokumentenklasse
* [ ] Posterklasse
* * [x] Seitengeometrie
* * [ ] Erstellung eines Rasters
* * [ ] Bereitstellung von Elementen für das Raster
* * [ ] Leitfaden für die Benutzung der Posterklasse
* [ ] Beamerklasse
* * [ ] Postergeometrie
* * [ ] Schriftgrößen
* * [ ] Schriftarten
* * [ ] Gestaltungselemente für Präsentationen
* * [ ] Leitfaden für die Benutzung der Präsentationsklasse.
