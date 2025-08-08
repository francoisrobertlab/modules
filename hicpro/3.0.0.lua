help([[
For detailed instructions, go to:
    https://github.com/nservant/HiC-Pro

This module loads the following modules and their requirements:
    - bowtie2/2.4.2
    - python/3.9.6
    - samtools/1.12
    - r-bundle-bioconductor/3.12
]])

whatis("Version: 3.0.0")
whatis("Keywords: HiC, Pipeline")
whatis("URL: https://github.com/nservant/HiC-Pro")
whatis("Description: An optimized and flexible pipeline for Hi-C data processing")

prereq("StdEnv/2020")
depends_on("gcc/9.3.0")
depends_on("bowtie2/2.4.2")
depends_on("python/3.9.6")
depends_on("samtools/1.12")
depends_on("r-bundle-bioconductor/3.12")

local module_path = myFileName()
local module_name = myModuleFullName()
local module_base = module_path:sub(1,module_path:find(module_name,1,true)-2)
local apps_base = module_base:gsub("(.*)/(.*)","%1")
local home = pathJoin(apps_base, module_name)
local version = myModuleVersion()
setenv("HICPRO", home)
setenv("HICPRO_VERSION", version)
prepend_path("PATH", pathJoin(home, "HiC-Pro_" .. version, "bin"))
prepend_path("PATH", pathJoin(home, "HiC-Pro_" .. version, "bin/utils"))
prepend_path("PATH", pathJoin(home, "venv/bin"))
