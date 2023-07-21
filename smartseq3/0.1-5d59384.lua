help([[
For detailed instructions, go to:
    https://github.com/sandberg-lab/Smart-seq3

This module sets the following environment variables:
    SMARTSEQ3:  directory containing Smart-seq3
]])

whatis("Version: 0.1-5d59384")
whatis("Keywords: NSG, RNA-seq, Smart-seq3, single-cell")
whatis("URL: https://github.com/sandberg-lab/Smart-seq3")
whatis("Description: Process and analyse Smart-seq3 libraries.")

prereq(atleast("r-bundle-bioconductor","3.8"))

local module_path = myFileName()
local module_name = myModuleFullName()
local module_base = module_path:sub(1,module_path:find(module_name,1,true)-2)
local apps_base = module_base:gsub("(.*)/(.*)","%1")
local home = pathJoin(apps_base, module_name)
local version = myModuleVersion()
prepend_path("PATH", pathJoin(home, "venv/bin"))
prepend_path("R_LIBS", pathJoin(home,"libs"))
setenv("SMARTSEQ3", home)
setenv("SMARTSEQ3_VERSION", version)
setenv("SMARTSEQ3_MODULE", pathJoin(module_base, myModuleName()))
setenv("SMARTSEQ3_PIP", "pysam==0.20.0 numpy==1.23.0 pandas==1.5.0 pygtrie==2.5.0 portion==2.3.0 joblib==1.2.0")
