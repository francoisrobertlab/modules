help([[
For detailed instructions, go to:
    https://github.com/srinivasramachandran/CallNucleosomes
    or its fork
    https://github.com/francoisrobertlab/CallNucleosomes

This module loads the following modules and their requirements:
    - perl/5.22.4
]])


whatis("Version: commit e5b433d after 0.1 from fork https://github.com/francoisrobertlab/CallNucleosomes")
whatis("Keywords: NGS, Nucleosomes Calling")
whatis("URL: https://github.com/srinivasramachandran/CallNucleosomes")
whatis("Description: Calls nucleosomes position")

always_load("StdEnv/2018.3")
always_load("perl/5.22.4")

local module_path = myFileName()
local module_name = myModuleFullName()
local module_base = module_path:sub(1,module_path:find(module_name,1,true)-2)
local apps_base = module_base:gsub("(.*)/(.*)","%1")
local home = pathJoin(apps_base, module_name)
prepend_path("PERL5LIB", pathJoin(home, "perl_library"))
