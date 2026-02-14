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

-- Erweiterung des Build Scripts
require "build-sharelatex-template.lua"



-- Identifizierung
module = "tudcdscr"
pkgversion = "0.6.0"
pkgdate    = "2026-02-02"

-- Dateipfade
sourcefiledir = "source"
docfiledir = "doc"
supportdir = "support"
--[[
  Die Examples müssen in diesem Verzeichnis sein.
]]
demofiledir = "examples"
testfiledir = "tests"
imagefiles = { "logo/*.pdf", "logo/*.eps" }
-- Ich habe Literaturverweise, diese müssen mit in das Verzeichnis für die Dokumentation kopiert werden.
typesetsuppfiles = { "*.bib" }
-- Dies sind Dateien welche vor der eigentlichen Dokumentation gesetzt werden müssen.
typesetdemofiles = { "demo-*.tex" }
excludefiles = {"*~","build.lua","config-*.lua","__**/*","demo-*.tex","handbook.tex"}
-- Diese beiden Dateien ergeben die Dokumentation.
typesetfiles = { "handbook.tex", "tudcd-doc.dtx" }
-- Automatisches Updaten der Version und Datum
tagfiles = { "*.dtx", "handbook.tex", "Readme.md" }

sourcefiles = { "*.ins", "*.dtx", "logo" }
installfiles = { "*.sty", "*.cls","logo" }
tdslocations = {"tex/latex/tudcdscr/logo/TUD-Logo*.pdf","tex/latex/tudcdscr/logo/TUD-Logo*.eps" }

flatten = false
flattentds = false

specialtypesetting = specialtypesetting or {}
specialtypesetting["demo-article.tex"] = {  cmd = "lualatex -interaction=nonstopmode" }

-- Einträge für ShareLatex Zips
sharelatex_template_files["beamer"] = {
  name = module .. "-sharelatex-beamer-" .. pkgversion,
  stylefiles = { "beamer*.sty", "tudcdcolor.sty", "tudcdfonts.sty", "logo" },
  demofiles = { "demo-pres.tex" },
  latexmkfile = "sharelatex-latexmkrc"
}
sharelatex_template_files["report"] = {
  name = module .. "-sharelatex-report-" .. pkgversion,
  stylefiles = { "tudcdreprt.cls", "logo" },
  demofiles = { "demo-report.tex" },
  latexmkfile = "sharelatex-latexmkrc"
}
sharelatex_template_files["article"] = {
  name = module .. "-sharelatex-article-" .. pkgversion,
  stylefiles = { "tudcdarticle.cls", "logo" },
  demofiles = { "demo-article.tex" },
  latexmkfile = "sharelatex-latexmkrc"
}

local mydate = os.date("!%Y-%m-%d")

function update_tag(file, content, tagname, tagdate)
  if not tagname and tagdate == mydate then
    tagname = pkgversion
    tagdate = pkgdate
    print("** "..file.." have been tagged with the version and date of build.lua")
  else
    local v_maj, v_min, patch = string.match(tagname, "^v?(%d+)%.(%d+)%.(%d+)$")
    if v_maj == "" or not v_min or not patch then
      print("Error!!: Invalid tag '"..tagname.."', none of the files have been tagged")
      os.exit(0)
    else
      tagname = string.format("%i.%i.%i", v_maj, v_min, patch)
      tagdate = mydate
    end
    print("** "..file.." have been tagged with the version "..tagname.." and date "..mydate)
  end

  if string.match(file, "%.dtx$") then
    local tagdate = string.gsub(tagdate, "-", "/")
    content = string.gsub(content,
                          "\\newcommand\\tudcd@common@version{%d+%p%d+%p%d+}",
                          "\\newcommand\\tudcd@common@version{"..tagname.."}")
    content = string.gsub(content,
                          "\\providecommand\\tudcd@common@version{%d+%p%d+%p%d+}",
                          "\\providecommand\\tudcd@common@version{"..tagname.."}")
    content = string.gsub(content,
                          "\\newcommand\\tudcd@common@date{%d%d%d%d/%d%d/%d%d}",
                          "\\newcommand\\tudcd@common@date{"..tagdate.."}")
    content = string.gsub(content,
                          "\\providecommand\\tudcd@common@date{%d%d%d%d/%d%d/%d%d}",
                          "\\providecommand\\tudcd@common@date{"..tagdate.."}")
    -- Zusätzlich wird "{dev-version}" mit dem momentanen Tag ersetzt
    content = string.gsub(content,
                          "{dev-version}",
                          tagname)
  end

  local tagdate = string.gsub(tagdate, "-", ".")
  if string.match(file, "handbook%.tex") then
    content = string.gsub(content,
                          "\\date{%d+%p%d+%p%d+}",
                          "\\date{"..tagdate.."}")
  end
  if string.match(file, "Readme%.md") then
    content = string.gsub(content,
                          "%%dev%-version%%",
                          tagname
                          )
  end
--[[
  if string.match(file, "CTANREADME.md") then
    local tagdate = string.gsub(tagdate, "/", "-")
    content = string.gsub(content,
                          "Version: (%d+)(%S+)",
                          "Version: "..tagname)
    content = string.gsub(content,
                          "Date: %d%d%d%d%-%d%d%-%d%d",
                          "Date: "..tagdate)
  end
]]
  return content
end

function tag_hook(tagname)
  os.execute('git commit -a -m "[l3build]: Step release tag"')
  os.execute('git tag -a -m "" ' .. tagname)
end

-- Configuration for ctan
ctanreadme = "CTANREADME.md"
ctanpkg    = "tudcdscr"
ctanzip    = ctanpkg.."-"..pkgversion
packtdszip = false

-- Load personal data for ctan upload
local ok, mydata = pcall(require, "mypersonaldata.lua")
if not ok then
  mydata = { email="XXX", uploader="YYY", }
end

uploadconfig = {
  author      = "Yoshi Diepelt",
  uploader    = mydata.uploader,
  email       = mydata.email,
  pkg         = ctanpkg,
  version     = pkgversion,
  license     = "lppl1.3c",
  summary     = "TUDCD-Script -- Corporate Design of Dresden University of Technology",
  description = [[This is the official bundle of classes implementing the 2025 Corporate Design of the Dresden University of Technology.]],
  topic       = { "presentation", "german-doc", "class", "doc-templ", "std-conform" },
  ctanPath    = "/macros/latex/contrib/" .. ctanpkg,
  repository  = "https://github.com/tud-cd/tudcd-scr",
  bugtracker  = "https://github.com/tud-cd/tudcd-scr/issues",
  support     = "https://github.com/tud-cd/tudcd-scr/issues",
  announcement_file="ctan.ann", -- The Announcement
  note_file   = "ctan.note", -- for the CTAN Team
  update      = false,
}

-- Clean files
cleanfiles = {
  ctanzip..".curlopt",
  ctanzip..".zip",
  "example.log",
  "example.pdf",
  "demopkg.pdf",
}
