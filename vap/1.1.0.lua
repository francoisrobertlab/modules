help([[
For detailed instructions, go to:
    http://lab-jacques.recherche.usherbrooke.ca/software_en/vap/
    https://bitbucket.org/labjacquespe/vap
]])

whatis("Version: 1.1.0")
whatis("Keywords: VAP, Utility")
whatis("URL: https://bitbucket.org/labjacquespe/vap")
whatis("Description: Versatile Aggregate Profiler (VAP)")

local module_path = myFileName()
local module_name = myModuleFullName()
local module_base = module_path:sub(1,module_path:find(module_name,1,true)-2)
local apps_base = module_base:gsub("(.*)/(.*)","%1")
local home = pathJoin(apps_base, module_name)
prepend_path("PATH", home)
setenv("VAP", home)
setenv("VAP_VERSION", myModuleVersion())
