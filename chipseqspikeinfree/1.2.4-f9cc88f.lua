help([[
For detailed instructions, go to:
    https://github.com/stjude/ChIPseqSpikeInFree

This module sets the following environment variables:
    CHIPSEQSPIKEINFREE:  directory containing ChIPseqSpikeInFree

This module requires the following modules:
    - r-bundle-bioconductor/3.17
]])

whatis("Version: 1.2.5")
whatis("Keywords: ChIPseqSpikeInFree, Utility")
whatis("URL: https://github.com/stjude/ChIPseqSpikeInFree")
whatis("Description: A Spike-in Free ChIP-Seq Normalization Approach for Detecting Global Changes in Histone Modifications.")

prereq("r-bundle-bioconductor/3.17")

local module_path = myFileName()
local module_name = myModuleFullName()
local module_base = module_path:sub(1,module_path:find(module_name,1,true)-2)
local apps_base = module_base:gsub("(.*)/(.*)","%1")
local home = pathJoin(apps_base, module_name)
local version = myModuleVersion()
prepend_path("PATH", home)
setenv("CHIPSEQSPIKEINFREE", home)
setenv("CHIPSEQSPIKEINFREE_VERSION", "f9cc88f618121e1a3bc075de49188f70179ff90a")
prepend_path("R_LIBS", pathJoin(home,"libs"))
