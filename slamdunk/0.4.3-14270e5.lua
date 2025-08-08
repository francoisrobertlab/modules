help([[
For detailed instructions, go to:
    https://github.com/t-neumann/slamdunk

This module sets the following environment variables:
    SLAMDUNK:  directory containing slamdunk
]])

whatis("Version: 0.4.3")
whatis("Keywords: slamdunk, Utility")
whatis("URL: https://github.com/t-neumann/slamdunk")
whatis("Description: Streamlining SLAMseq analysis with ultra-high sensitivity.")

prereq(atleast("apptainer","1"))

local module_path = myFileName()
local module_name = myModuleFullName()
local module_base = module_path:sub(1,module_path:find(module_name,1,true)-2)
local apps_base = module_base:gsub("(.*)/(.*)","%1")
local home = pathJoin(apps_base, module_name)
prepend_path("PATH", home)
setenv("SLAMDUNK", home)
setenv("SLAMDUNK_VERSION", myModuleVersion())
setenv("SLAMDUNK_COMMIT", "14270e5794d36270f601a88c0bf369899d8ab4a0")
LmodMessage("To execute slamdunk run: apptainer run $SLAMDUNK/slamdunk-0.4.3-14270e5.sif\n")
