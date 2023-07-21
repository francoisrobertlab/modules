help([[
For detailed instructions, go to:
    https://github.com/sandberg-lab/txburst

This module sets the following environment variables:
    TXBURST:  directory containing Smart-seq3
]])

whatis("Version: 0.1-0146527")
whatis("Keywords: NSG, RNA-seq, Smart-seq3, single-cell")
whatis("URL: https://github.com/sandberg-lab/Smart-seq3")
whatis("Description: Process and analyse Smart-seq3 libraries.")

local module_path = myFileName()
local module_name = myModuleFullName()
local module_base = module_path:sub(1,module_path:find(module_name,1,true)-2)
local apps_base = module_base:gsub("(.*)/(.*)","%1")
local home = pathJoin(apps_base, module_name)
local version = myModuleVersion()
prepend_path("PATH", pathJoin(home, "venv/bin"))
prepend_path("PATH", home)
setenv("TXBURST", home)
setenv("TXBURST_VERSION", version)
setenv("TXBURST_PIP", "numpy==1.23.0 pandas==1.5.0 scipy==1.9.3 joblib==1.2.0")
