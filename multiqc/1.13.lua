help([[
For detailed instructions, go to:
    https://multiqc.info
    or
    https://github.com/ewels/MultiQC

This module sets the following environment variables:
    MULTIQC:  directory containing MultiQC
]])

whatis("Version: 1.13")
whatis("Keywords: NGS, Utility, QC")
whatis("URL: https://multiqc.info")
whatis("Description: Aggregate results from bioinformatics analyses across many samples into a single report.")

local module_path = myFileName()
local module_name = myModuleFullName()
local module_base = module_path:sub(1,module_path:find(module_name,1,true)-2)
local apps_base = module_base:gsub("(.*)/(.*)","%1")
local home = pathJoin(apps_base, module_name)
local version = myModuleVersion()
prepend_path("PATH", pathJoin(home, "venv/bin"))
setenv("MULTIQC", home)
setenv("MULTIQC_VERSION", version)
