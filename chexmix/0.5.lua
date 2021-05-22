help([[
For detailed instructions, go to:
    http://mahonylab.org/software/chexmix/

This module sets the following environment variables:
    CHEXMIX_BASE:  directory containing ChExMix
    CHEXMIX_JAR:   ChExMix jar file

This module loads the following modules and their requirements:
    - java/1.8.0_191
    - meme/5.2.0
]])

whatis("Version: 0.5")
whatis("Keywords: NGS, Peak Calling")
whatis("URL: http://mahonylab.org/software/chexmix")
whatis("Description: ChExMix: the ChIP-exo mixture model")

always_load("StdEnv/2020")
always_load("gcc/9.3.0")
always_load("java/1.8.0_192")
always_load("meme/5.2.0")

local module_path = myFileName()
local module_name = myModuleFullName()
local module_base = module_path:sub(1,module_path:find(module_name,1,true)-2)
local apps_base = module_base:gsub("(.*)/(.*)","%1")
local home = pathJoin(apps_base, module_name)
local jar = pathJoin(home, "chexmix_v0.5.jar")
setenv("CHEXMIX_BASE", home)
setenv("CHEXMIX_JAR", jar)
io.stderr:write("To execute ChExMix run: java -jar $CHEXMIX_JAR\n")
