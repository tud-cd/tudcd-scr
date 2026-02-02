# LaTeX Klassen für das Corporate Design der Technischen Universität Dresden

> [!CAUTION]
> Diese Klassen sind noch in einem Entwicklungsstadium! Es können daher beim Updaten auf neuere Versionen Inkompatibilitäten entstehen!

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

## Beispieldateien

Beispieldateien befinden sich innerhalb des `doc` Verzeichnisses sowie innerhalb des Handbuchs.

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
