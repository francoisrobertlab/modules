help([[
For detailed instructions, go to:
    https://github.com/francoisrobertlab/robtools

This module sets the following environment variables:
    ROBTOOLS:  directory containing robtools

You will need to load all the following module(s) before the "robtools-core" module is available to load.
    - python/3.5.4 or greater
]])

whatis("Version: 2.0")
whatis("Keywords: NGS, Utility")
whatis("URL: https://github.com/francoisrobertlab/robtools")
whatis("Description: Tools to analyze next-generation sequencing (NGS) data")

prereq(atleast("python","3.5.4"))

local module_path = myFileName()
local module_name = myModuleFullName()
local module_base = module_path:sub(1,module_path:find(module_name,1,true)-2)
local apps_base = module_base:gsub("(.*)/(.*)/(.*)","%1")
local home = pathJoin(apps_base, module_name)
prepend_path("PATH", pathJoin(home, "bash"))
prepend_path("PATH", pathJoin(home, "venv/bin"))
setenv("ROBTOOLS", home)
