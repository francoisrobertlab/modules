help([[
For detailed instructions, go to:
    https://github.com/sdparekh/zUMIs

This module sets the following environment variables:
    ZUMIS:  directory containing zUMIs
]])

whatis("Version: 2.9.7")
whatis("Keywords: NSG, RNA-seq, single-cell")
whatis("URL: https://github.com/sdparekh/zUMIs")
whatis("Description: Fast and flexible pipeline to process RNA-seq data with (or without) UMIs.")

prereq(atleast("perl","5.16.3"))
prereq(atleast("samtools","1.8"))
prereq(atleast("star","2.5.2b"))
prereq(atleast("r-bundle-bioconductor","3.8"))

local module_path = myFileName()
local module_name = myModuleFullName()
local module_base = module_path:sub(1,module_path:find(module_name,1,true)-2)
local apps_base = module_base:gsub("(.*)/(.*)","%1")
local home = pathJoin(apps_base, module_name)
local version = myModuleVersion()
prepend_path("PATH", home)
setenv("ZUMIS", home)
setenv("ZUMIS_VERSION", version)
setenv("ZUMIS_MODULE", pathJoin(module_base, myModuleName()))
prepend_path("R_LIBS", pathJoin(home,"libs"))
prepend_path("PATH", pathJoin(home, "venv/bin"))
