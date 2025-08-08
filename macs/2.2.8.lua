help([[
For detailed instructions, go to:
    https://github.com/macs3-project/MACS

This module sets the following environment variables:
    MACS:  directory containing MACS
]])

whatis("Version: 2.2.8")
whatis("Keywords: NGS, Utility, Peak calling")
whatis("URL: https://github.com/macs3-project/MACS")
whatis("Description: MACS captures the influence of genome complexity to evaluate the significance of enriched ChIP regions.")

local module_path = myFileName()
local module_name = myModuleFullName()
local module_base = module_path:sub(1,module_path:find(module_name,1,true)-2)
local apps_base = module_base:gsub("(.*)/(.*)","%1")
local home = pathJoin(apps_base, module_name)
local version = myModuleVersion()
prepend_path("PATH", pathJoin(home, "venv/bin"))
setenv("MACS", home)
setenv("MACS_VERSION", version)
