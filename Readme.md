# LaTeX Klassen für das Corporate Design der Technischen Universität Dresden

> [!CAUTION]
> Diese Klassen sind noch in einem Entwicklungsstadium! Es können daher beim Updaten auf neuere Versionen Inkompatibilitäten entstehen!


> [!CAUTION]
> Bitte nutzen Sie keine Large Language Modelle oder Generative Künstliche Ingelligenz zum Beantworten von Dokumentationsfragen / Einstellungsfragen bezüglich dieses Bundles!
> Die generierten Codesegmente werden, aufgrund der Neuheit dieser Klassen, mitunter inkompatible Einstellungen vornehmen!


> Bei Fragen zu Einstellungen oder fehlenden Features eröffnen Sie bitte ein [Issue](https://github.com/tud-cd/tudcd-scr/issues).
> Sollten Sie keinen Github Account besitzen, dann schreiben Sie bitte eine [Email](mailto:david.diepelt@gmx.net?subject=%5Btudcd-scr%5D%3A%20).

## Inhaltsverzeichnis

* [Welche Klassen gibt es?](#welche-klassen-gibt-es)
* [Wie verwende ich diese Klassen?](#wie-verwende-ich-diese-klassen)
* [Wo kann geholfen werden?](#wo-kann-geholfen-werden)
* [Versionsverlauf](#versionsverlauf)
<!-- * [In eigener Sache](#in-eigener-sache) -->

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
   * MacTeX Installationen: Hierzu habe ich keine Informationen gefunden, bei Informationen hierzu, ist ein [Issue](https://github.com/tud-cd/tudcd-scr/issues) angebracht :D.
2. Wenden Sie auf der Konsole den Befehl
   ```
   l3build install
   ```
   an.
   * Sollte das Ausführen des Befehls fehlschlagen, so wurde die `TEXMFHOME` Systemumgebungsvariable nicht gesetzt.
     Dies kann abhängig von Betriebssystem unterschiedlich eingestellt werden:
     * Windows-basierte Betriebssystem:
       - Wenn Sie hierzu eine gute Anleitung finden, dann öffen sie bitte ein [Issue](https://github.com/tud-cd/tudcd-scr/issues).
     * Linux-basierte Betriebssysteme:
       - Fügen Sie in der `~/.bashrc` Ihres   Benutzerverzeichnisses die Zeilen
         ```bash
         TEXMFHOME = "~/texmf"
         export TEXMFHOME
         ```
         ein. Dies bewirkt, dass weitere Kommandozeilen mit einer gesetzten `TEXMFHOME` Umgebungsvariable starten.

         Sollten Sie eine andere Kommandozeile als `bash` nutzen, und die einstellungen sollten dort anders sein, dann öffnen sie bitte ein Issue.
   * Sie können ein erfolgreiches Setzen der `TEXMFHOME` Umgebungsvariable überprüfen, indem sie nach Modifikation
   eine Kommandozeile öffnen und den Befehl
     ```
     kpsewhich -var-value TEXMFHOME
     ```
     ausführen. Es sollte anschließend der gesetzte Wert
     ```
     ~/texmf
     ```
     auf der Kommandozeile erscheinen.
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

<!--comment
## In eigener Sache

Die hier vorgestellten Klassen sollen in der Zukunft die Institutseigenen Lösungen ersetzen.
Es ist dennoch vom großen Interesse, eine historische Aufarbeitung institutseigener Vorlagen für LaTeX
zu erwirken. Dies bezweckt neben dem Archivzweck und der Würdigung der Arbeit vergangender TeXniker:innen,
auch eine Nacherhebung des Bedarfs von LaTeX Vorlagen an der TUD.

Zu diesem Zweck der historischen Aufarbeitung nehme ich Beiträge, Git Repositories, Links und Klassendateien
unter [meiner Email Addresse](mailto:david.diepelt@gmx.net?subject=%5BTUD%20LaTeX%5D%3A%20) `david.diepelt(at)gmx.net` mit dem Betreff `[TUD LaTeX]: <Hier Persönlichen Betreff einfügen>` dankend an.
Schreiben Sie bitte dazu, wer sie entwickelt hat, und ab wann bis wann sie ungefähr in der Verwendung waren.
-->

## Versionsverlauf

* `%dev-version%`
  * Hotfix für ältere TeXLive Distributionen: `\l_key_choice_str` zu `\l_key_choice_tl` geändert.
  * Umschreiben der Interna der Beamervorlage.
  * Einführen von Metafarben für das Paket `xcolor`
  * Neue Farbauswahl für die Beamervorlage
  * Konfigurierbare Fußzeilen für alle Folien.
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
