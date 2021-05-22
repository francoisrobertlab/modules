help([[
For detailed instructions, go to:
    https://www.bioconductor.org/packages/release/bioc/html/ChIPexoQual.html

This module sets the following environment variables:
    CHIPEXOQUAL_BASE:  directory containing ChIPexoQual
    R_LIBS_USER:       sets R library directory to use ChIPexoQual
    R_PROFILE_USER:    allows to configure CPAN automatically

This module loads the following modules:
    - r/4.0.2

You will need to load all module(s) on any one of the lines below before the "chipexoqual" module is available to load.
    gcc/7.3.0
]])

whatis("Version: 1.0 or later, but before 1,1")
whatis("Keywords: ChIPexoQual, Utility")
whatis("URL: https://www.bioconductor.org/packages/release/bioc/html/ChIPexoQual.html")
whatis("Description: Quality control pipeline for ChIP-exo/nexus data.")

prereq("gcc/7.3.0")
always_load("r/4.0.2")

local module_path = myFileName()
local module_name = myModuleFullName()
local module_base = module_path:sub(1,module_path:find(module_name,1,true)-2)
local apps_base = module_base:gsub("(.*)/(.*)","%1")
local home = pathJoin(apps_base, module_name)
prepend_path("PATH", home)
setenv("CHIPEXOQUAL_BASE", home)
setenv("R_LIBS_USER", pathJoin(home,"libs"))
setenv("R_PROFILE_USER", pathJoin(home,".Rprofile"))
