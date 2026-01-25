#!/usr/bin/env texlua

--[[
  Build script for the tudcd-scr project
  Copyright (C) 2025–2026 Jochen Diepelt

  This file is part of the build system of the tudcd-scr bundle.

  It may be distributed and/or modified under the conditions of the
  LaTeX Project Public License (LPPL), either version 1.3c of this
  license or (at your option) any later version. The latest version
  of this license is in the file

  https://www.latex-project.org/lppl.txt
]]


-- Identifizierung
module = "tudcd"
pkgversion = "0.5.4"
pkgdate    = "2026-01-25"

-- Dateipfade
sourcefiledir = "source"
docfiledir = "doc"
supportdir = "support"
--[[
  Die Examples müssen in diesem Verzeichnis sein.
]]
demofiledir = "examples"
testfiledir = "tests"
-- Ich habe Literaturverweise, diese müssen mit in das Verzeichnis für die Dokumentation kopiert werden.
typesetsuppfiles = { "*.bib" }
-- Dies sind Dateien welche vor der eigentlichen Dokumentation gesetzt werden müssen.
typesetdemofiles = {  }
-- Diese beiden Dateien ergeben die Dokumentation.
typesetfiles = { "tudcd-doc.dtx", "handbook.tex" }
--
