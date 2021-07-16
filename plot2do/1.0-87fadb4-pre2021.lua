help([[
Module used for analysis before june 2021.
The module 'plot2do/1.0-87fadb4' should give identical results, but this module
    is provided in case there are small differences.

For detailed instructions, go to:
    https://github.com/rchereji/plot2DO

This module sets the following environment variables:
    PLOT2DO:  directory containing plot2DO

This module loads the following modules:
    - r/3.6.0

You will need to load all module(s) on any one of the lines below before the "plot2do" module is available to load.
    gcc/7.3.0
]])

whatis("Version: commit 87fadb4 after 1.0")
whatis("Keywords: plot2DO, Utility")
whatis("URL: https://github.com/rchereji/plot2DO")
whatis("Description: Plot 2D Occupancies")

prereq("gcc/7.3.0")
depends_on("r/3.6.0")

local module_path = myFileName()
local module_name = myModuleFullName()
local module_base = module_path:sub(1,module_path:find(module_name,1,true)-2)
local apps_base = module_base:gsub("(.*)/(.*)","%1")
local home = pathJoin(apps_base, module_name)
setenv("PLOT2DO", home)
setenv("PLOT2DO_VERSION", myModuleVersion())
setenv("PLOT2DO_MODULE", pathJoin(module_base, myModuleName()))
setenv("R_LIBS_USER", pathJoin(home, "libs"))
setenv("R_PROFILE_USER", pathJoin(home, ".Rprofile"))
