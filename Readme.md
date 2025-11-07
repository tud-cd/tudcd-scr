# LaTeX Klassen für das Corporate Design der Technischen Universität Dresden



## Wie verwende ich diese Klassen?

Bevor eine nette Installationsdatei das abnimmt, ist der Ablauf:

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
```

## Featureliste

* [ ] Logodateien
* [ ] Dokumentenklassen
* * [x] Seitengeometrie
* * [x] Konfigurierbarkeit der Seitengeometrie
* * [x] Einstellen der Schriftarten für LaTeX
* * [ ] Einstellen der Schriftarten für LuaLaTeX/XeLaTeX
* * [ ] Einstellen der Schriftgrößen
* * [x] Hinzufügen von Titelseiten und Zitatseiten
* * [ ] Einstellungen der Schriftmerkmale für Dokumentationsbestandteile
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