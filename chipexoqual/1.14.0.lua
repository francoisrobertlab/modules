help([[
For detailed instructions, go to:
    https://www.bioconductor.org/packages/release/bioc/html/ChIPexoQual.html

This module sets the following environment variables:
    CHIPEXOQUAL:  directory containing ChIPexoQual

This module loads the following modules:
    - r-bundle-bioconductor/3.12

You will need to load all module(s) on any one of the lines below before the "chipexoqual" module is available to load.
    gcc/9.3.0
]])

whatis("Version: 1.14.0")
whatis("Keywords: ChIPexoQual, Utility")
whatis("URL: https://www.bioconductor.org/packages/release/bioc/html/ChIPexoQual.html")
whatis("Description: Quality control pipeline for ChIP-exo/nexus data.")

prereq("StdEnv/2020")
depends_on("gcc/9.3.0")
depends_on("r-bundle-bioconductor/3.12")

local module_path = myFileName()
local module_name = myModuleFullName()
local module_base = module_path:sub(1,module_path:find(module_name,1,true)-2)
local apps_base = module_base:gsub("(.*)/(.*)","%1")
local home = pathJoin(apps_base, module_name)
prepend_path("PATH", home)
setenv("CHIPEXOQUAL_BASE", home)   -- For compatibility with robtools code
setenv("CHIPEXOQUAL", home)
setenv("CHIPEXOQUAL_SCRIPT_VERSION", "master")
prepend_path("R_LIBS", pathJoin(home,"libs"))
