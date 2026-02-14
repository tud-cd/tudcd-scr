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

--[[
In dem Table sind weitere Tables mit jeweils

Einer Liste an Dateien aus l3build unpack, sowie
Einer Liste an Dateien aus l3build doc
]]

local lfs = require("lfs")
local newzip = require"l3build-zip"

local gsub  = string.gsub
local attributes = lfs.attributes



sharelatex_template_files = {} -- Hier ist ein Table erstellt worden.


function sharelatex_templates()
  local errorlevel = unpack()
  for entry, values in pairs(sharelatex_template_files) do
    print("Packaging ShareLatex: " .. entry)
    name = values.name
    dir = builddir .. '/' .. "sharelatex" .. '/'  .. name
    mkdir(dir)
    -- This are all files, which need to be included in the tex/ directory
    for _,stylefile in ipairs(values.stylefiles) do
      -- local dir of archive
      local texdir = dir .. "/tex"
      mkdir(texdir)
      -- tree(  ) macht matching magie
      local destpath,globstub = splitpath(stylefile)
      destpath = unpackdir .. gsub(gsub(destpath,"^./",""),"^.","")
      for _,p in ipairs(tree(unpackdir,globstub)) do
        local path,srcname = splitpath(p.cwd)
        rm(srcname,texdir)
        cp(srcname,path,texdir)
      end
    end
    -- This is the demofile for starting quickly
    for _,demofile in ipairs(values.demofiles) do
      -- tree(  ) macht matching magie
      local destpath,globstub = splitpath(demofile)
      destpath = docfiledir .. gsub(gsub(destpath,"^./",""),"^.","")
      for _,p in ipairs(tree(docfiledir,globstub)) do
        local path,srcname = splitpath(p.cwd)
        rm(srcname,dir)
        cp(srcname,path,dir)
      end
    end
    -- And here we embed the latexmk
    local destpath,filename = splitpath(values.latexmkfile)
    destpath = supportdir .. gsub(gsub(destpath,"^./",""),"^.","")
    rm(".latexmkrc",dir)
    cp(filename,destpath,dir)
    ren(dir,filename,".latexmkrc")
    -- Now we zip it all
    local function tab_to_check(table)
      local patterns = {}
      for n,i in ipairs(table) do
        patterns[n] = glob_to_pattern(i)
      end
      return function(name)
        for n, patt in ipairs(patterns) do
          if name:match"([^/]*)$":match(patt) then return true end
        end
        return false
      end
    end
    -- Convert the tables of files to quoted strings
    local binfile = tab_to_check(binaryfiles)
    local exefile = tab_to_check(exefiles)
    --
    zipname = name .. ".zip"
    local zip = assert(newzip(builddir .. '/' .. zipname))
    for _, p in ipairs(tree(dir, "**")) do
      local src = p.src:sub(3) -- Strip ./
      if not (attributes(p.cwd, "mode") == "directory" or src == zipname) then
        zip:add(p.cwd, src, binfile(src), exefile(src))
      end
    end
    zip:close()
  end
end

target_list_name = "sharelatex"

target_list[target_list_name] = {
  desc = "Creates Sharelatex Template Zip Archives",
  func = sharelatex_templates
}