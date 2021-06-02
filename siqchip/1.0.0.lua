help([[
For detailed instructions, go to:
    https://github.com/BradleyDickson/siQ-ChIP.git

This module sets the following environment variables:
    SIQCHIP:  directory containing siQ-ChIP
]])

whatis("Version: 1.0.0")
whatis("Keywords: NGS, Quantitative ChIP-seq")
whatis("URL: https://github.com/BradleyDickson/siQ-ChIP.git")
whatis("Description: Sans spike-in Quantitative ChIP-seq")

prereq(atleast("StdEnv","2018.3"))

local module_path = myFileName()
local module_name = myModuleFullName()
local module_base = module_path:sub(1,module_path:find(module_name,1,true)-2)
local apps_base = module_base:gsub("(.*)/(.*)","%1")
local home = pathJoin(apps_base, module_name)
setenv("SIQ_CHIP_BASE", home)   -- For compatibility with robtools code
setenv("SIQCHIP", home)
setenv("SIQCHIP_VERSION", module_version)
setenv("SIQCHIP_MODULE", pathJoin(module_base, myModuleName()))
