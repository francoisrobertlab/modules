help([[
For detailed instructions, go to:
    http://homer.ucsd.edu/homer/index.html

This module loads the following modules and their requirements:
    - perl/5.30.2
    - samtools/1.12
    - r-bundle-bioconductor/3.12
]])

whatis("Version: 4.11.1")
whatis("Keywords: NGS, Motif discovery")
whatis("URL: http://homer.ucsd.edu/homer/index.html")
whatis("Description: Software for motif discovery and next generation sequencing analysis")

always_load("StdEnv/2020")
always_load("gcc/9.3.0")
always_load("perl/5.30.2")
always_load("samtools/1.12")
always_load("r-bundle-bioconductor/3.12")

local module_path = myFileName()
local module_name = myModuleFullName()
local module_base = module_path:sub(1,module_path:find(module_name,1,true)-2)
local apps_base = module_base:gsub("(.*)/(.*)","%1")
local home = pathJoin(apps_base, module_name)
setenv("HOMER", home)
setenv("HOMER_VERSION", myModuleVersion())
prepend_path("PATH", pathJoin(home, "bin"))
