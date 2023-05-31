help([[
For detailed instructions, go to:
    https://deeptools.readthedocs.io/en/develop/index.html
    or
    https://github.com/deeptools/deepTools/

This module sets the following environment variables:
    DEEPTOOLS:  directory containing deeptools
]])

whatis("Version: 3.5.1")
whatis("URL: https://github.com/deeptools/deepTools/")
whatis("Description: Suite of python tools for the analysis of high-throughput sequencing data.")

local module_path = myFileName()
local module_name = myModuleFullName()
local module_base = module_path:sub(1,module_path:find(module_name,1,true)-2)
local apps_base = module_base:gsub("(.*)/(.*)","%1")
local home = pathJoin(apps_base, module_name)
local version = myModuleVersion()
prepend_path("PATH", pathJoin(home, "venv/bin"))
setenv("DEEPTOOLS", home)
setenv("DEEPTOOLS_VERSION", version)
setenv("DEEPTOOLS_PIP_CC", "numpy==1.23.0 scipy==1.9.3 py2bit==0.3.0 pyBigWig==0.3.18 pysam==0.20.0 matplotlib==3.4.2")
