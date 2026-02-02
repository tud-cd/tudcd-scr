# LaTeX Klassen für das Corporate Design der Technischen Universität Dresden

> [!CAUTION]
> Diese Klassen sind noch in einem Entwicklungsstadium! Es können daher beim Updaten auf neuere Versionen Inkompatibilitäten entstehen!

## Welche Klassen gibt es?

Zum Zeitpunkt des Schreibens beinhaltet das Bundle ein
* `tudcdartcl`, eine Artikelklasse
* `tudcdreprt`, eine Reportklasse
* sowie ein `beamer` Theme `tudcd`.

## Wie verwende ich diese Klassen?

### Lokale Installation

1. Wenn nicht geschehen, setzen der `TEXMFHOME` Variable. Hilfe und weiterführende Links hierzu finden Sie unter
   * [TeXLive Installationen](https://tex.stackexchange.com/q/1137)
   * [MikTeX Installationen](https://tex.stackexchange.com/a/2066)
   * MacTeX Installationen: Hierzu habe ich keine Informationen gefunden, bei Informationen hierzu, ist ein Issue angebracht :D.
2. Wenden Sie auf der Konsole den Befehl
   ```
   l3build install
   ```
   an.
3. Die Klassen können nun genutzt werden.

### Nutzung in Overleaf

Um eine Nutzung der aktuellsten Version auf Overleaf/ShareLaTeX zu ermöglichen, stehen herunterladbare `.zip`
im Release Bereich bereit.

### Beispieldateien

Beispieldateien befinden sich innerhalb des `doc` Verzeichnisses sowie innerhalb des Handbuchs.

## Wo kann geholfen werden?

* Einstellungen bzgl. LuaLaTeX
  * Zur Einstellung der Schriften wird momentan `fontspec` verwendet. Dieses muss umfangreich konfiguriert werden um korrekte Ergebnisse zu erzielen. Jegliche Hilfe ist hier sehr willkommen.
* Fehler im Handbuch oder Funktionsweise finden und ein Minimalbeispiel zum Reproduzieren erstellen
* Gestalten von alternativen Titelseiten, die Konstruktion des Shapes befindet sich in der `demo-report.tex`
* Weitere Eigenschaften des Shapes benennen, welche in der `demo-report.tex` gesammelt werden können.

# Versionsverlauf

* `0.5.6` Neuschreiben mit `expl3`-Syntax zum Zwecke der Vereinheitlichung und Wartbarkeit.
  * Wechseln zum System `l3build`
  * Verbesserte Einstellung von Schriften in LuaLaTeX, Danke an @tipfom für den Input.
  * Einführen von `\TUDCDsetup` als zentrale Schnittstelle für Einstellungen von Klassenoptionen
  * Einführen der Optionen `logo/language`, `logo/color`, `logo/colormodel`
  * Einführen der Optionen `useseriffont`
  * Verbessern der globalen Option `fontsize`
  * Flexiblere Gestaltung der internen Geometrieeinstellungen
  * Einführen von flexibleren Schnittstellen für die Ausgabe von
    Titelseiten
  * Bessere Fehlermeldungen bei nicht erlaubten Kombinationen von Einstellungen
