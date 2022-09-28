help([[
For detailed instructions, go to:
    https://cutadapt.readthedocs.io/en/stable
    or
    https://github.com/marcelm/cutadapt

This module sets the following environment variables:
    CUTADAPT:  directory containing Cutadapt
]])

whatis("Version: 4.1")
whatis("Keywords: NGS, Utility, Adapters")
whatis("URL: https://cutadapt.readthedocs.io/en/stable")
whatis("Description: Cutadapt finds and removes adapter sequences, primers, poly-A tails and other types of unwanted sequence from your high-throughput sequencing reads.")

local module_path = myFileName()
local module_name = myModuleFullName()
local module_base = module_path:sub(1,module_path:find(module_name,1,true)-2)
local apps_base = module_base:gsub("(.*)/(.*)","%1")
local home = pathJoin(apps_base, module_name)
local version = myModuleVersion()
prepend_path("PATH", pathJoin(home, "venv/bin"))
setenv("CUTADAPT", home)
setenv("CUTADAPT_VERSION", version)
