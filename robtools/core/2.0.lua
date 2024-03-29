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

local module_path = myFileName()
local module_name = myModuleFullName()
local module_base = module_path:sub(1,module_path:find(module_name,1,true)-2)
local apps_base = module_base:gsub("(.*)/(.*)","%1")
local robtools_module_name = module_name:gsub("(.*)/(.*)/(.*)","%1/%3")
local home = pathJoin(apps_base, robtools_module_name)
local module_version = myModuleVersion()
local version = module_version:gsub("(.*)/(.*)","%2")
prepend_path("PATH", pathJoin(home, "bash"))
prepend_path("PATH", pathJoin(home, "venv/bin"))
setenv("ROBTOOLS", home)
setenv("ROBTOOLS_VERSION", version)
setenv("ROBTOOLS_PIP", "Click==7.0 pandas==0.25.3 pyBigWig==0.3.17 matplotlib==3.1.1 scipy==1.3.2 lmfit==1.0.0 pysam==0.15.4 more-itertools==8.9.0 PyYAML==6.0")
