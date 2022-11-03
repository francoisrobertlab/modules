help([[
For detailed instructions, go to:
    https://github.com/FelixKrueger/SNPsplit

This module sets the following environment variables:
    SNPSPLIT:  directory containing SNPsplit
]])

whatis("Version: 0.5.0")
whatis("Keywords: Alignment, Allele")
whatis("URL: https://github.com/FelixKrueger/SNPsplit")
whatis("Description: Allele-specific alignment sorting.")

prereq("StdEnv/2020")
depends_on("perl/5.30.2")

local module_path = myFileName()
local module_name = myModuleFullName()
local module_base = module_path:sub(1,module_path:find(module_name,1,true)-2)
local apps_base = module_base:gsub("(.*)/(.*)","%1")
local home = pathJoin(apps_base, module_name)
local version = myModuleVersion()
prepend_path("PATH", home)
setenv("SNPSPLIT", home)
setenv("SNPSPLIT_VERSION", version)
