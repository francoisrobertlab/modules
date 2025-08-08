help([[
For detailed instructions, go to:
    https://groups.csail.mit.edu/cgs/gem/

This module sets the following environment variables:
    GEM:      directory containing GEM and default read distributions files
    GEM_JAR:  GEM jar file

This module loads the following modules and their requirements:
    - java/1.8.0_192
]])

whatis("Version: 3.4")
whatis("Keywords: NGS, Peak Calling")
whatis("URL: https://groups.csail.mit.edu/cgs/gem/")
whatis("Description: GEM: High resolution peak calling and motif discovery for ChIP-seq and ChIP-exo data")

prereq("StdEnv/2020")
depends_on("java/1.8.0_192")

local module_path = myFileName()
local module_name = myModuleFullName()
local module_base = module_path:sub(1,module_path:find(module_name,1,true)-2)
local apps_base = module_base:gsub("(.*)/(.*)","%1")
local home = pathJoin(apps_base, module_name)
local jar = pathJoin(home, "gem.jar")
setenv("GEM", home)
setenv("GEM_VERSION", myModuleVersion())
setenv("GEM_JAR", jar)
LmodMessage("To execute GEM run: java -jar $GEM_JAR\n")
