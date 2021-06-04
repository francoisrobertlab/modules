help([[
For detailed instructions, go to:
    https://github.com/samtools/samtools
]])

whatis("Version: 1.8")
whatis("Keywords: NGS, samtools")
whatis("URL: https://github.com/samtools/samtools")
whatis("Description: Tools (written in C using htslib) for manipulating next-generation sequencing data")

local module_path = myFileName()
local module_name = myModuleFullName()
local module_base = module_path:sub(1,module_path:find(module_name,1,true)-2)
local apps_base = module_base:gsub("(.*)/(.*)","%1")
local home = pathJoin(apps_base, module_name)
setenv("SAMTOOLS", home)
setenv("SAMTOOLS_VERSION", myModuleVersion())
prepend_path("PATH", pathJoin(home, "bin"))
