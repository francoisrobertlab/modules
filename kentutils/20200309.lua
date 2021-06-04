help([[
For detailed instructions, go to:
    https://github.com/ucscGenomeBrowser/kent
    http://hgdownload.soe.ucsc.edu/admin/exe/
]])

whatis("Version: 20200309 - v395_base")
whatis("Keywords: Utility")
whatis("URL: https://github.com/ucscGenomeBrowser/kent")
whatis("Description: Genome Browser and Blat application binaries built for standalone
                     command-line use")

local module_path = myFileName()
local module_name = myModuleFullName()
local module_base = module_path:sub(1,module_path:find(module_name,1,true)-2)
local apps_base = module_base:gsub("(.*)/(.*)","%1")
local home = pathJoin(apps_base, module_name)
setenv("KENTUTILS", home)
setenv("KENTUTILS_VERSION", myModuleVersion())
prepend_path("PATH", home)
