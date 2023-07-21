help([[
For detailed instructions, go to:
    https://github.com/alexdobin/STAR

This module sets the following environment variables:
    STAR:  directory containing STAR
]])

whatis("Version: 2.5.4b")
whatis("Keywords: NSG, RNA-seq")
whatis("URL: https://github.com/alexdobin/STAR")
whatis("Description: Spliced Transcripts Alignment to a Reference.")

prereq("StdEnv/2020")

local module_path = myFileName()
local module_name = myModuleFullName()
local module_base = module_path:sub(1,module_path:find(module_name,1,true)-2)
local apps_base = module_base:gsub("(.*)/(.*)","%1")
local home = pathJoin(apps_base, module_name)
local version = myModuleVersion()
prepend_path("PATH", home)
setenv("STAR", home)
setenv("STAR_VERSION", version)
