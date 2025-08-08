help([[
For detailed instructions, go to:
    http://daehwankimlab.github.io/hisat2/hisat-3n/
    or
    https://github.com/DaehwanKimLab/hisat2
]])

whatis("Version: 2.2.1")
whatis("URL: https://github.com/DaehwanKimLab/hisat2")
whatis("Description: HISAT2 is a fast and sensitive alignment program for mapping next-generation sequencing reads to a population of human genomes")

prereq("StdEnv/2023")

local module_path = myFileName()
local module_name = myModuleFullName()
local module_base = module_path:sub(1,module_path:find(module_name,1,true)-2)
local apps_base = module_base:gsub("(.*)/(.*)","%1")
local home = pathJoin(apps_base, module_name)
local version = myModuleVersion()
setenv("HISAT3N", home)
setenv("HISAT3N_VERSION", version)
setenv("HISAT3N_COMMIT", "f5dda37bd1340f74ab91deace470aebc66e87a2d")
prepend_path("PATH", home)
