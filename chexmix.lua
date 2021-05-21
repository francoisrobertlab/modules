help([[
For detailed instructions, go to:
    http://mahonylab.org/software/chexmix/

This module loads the following modules and their requirements:
    - java/1.8.0_121
    - meme/5.2.0
    - robtools-core
]])

whatis("Version: 0.5")
whatis("Keywords: NGS, Peak Calling")
whatis("URL: http://mahonylab.org/software/chexmix")
whatis("Description: ChExMix: the ChIP-exo mixture model")

always_load("nixpkgs/16.09")
always_load("StdEnv/2020")
always_load("gcc/9.3.0")
always_load("openmpi/4.0.3")
always_load("java/1.8.0_121")
always_load("meme/5.2.0")
always_load("python/3.8.2")
always_load("robtools-core")

local home = os.getenv("HOME") or ""
local chexmix = pathJoin(home, "projects/def-robertf/chexmix")
local chexmix_jar = pathJoin(chexmix, "chexmix_v0.5.jar")
setenv("CHEXMIX_BASE", chexmix)
setenv("CHEXMIX_JAR", chexmix_jar)
io.stderr:write("To execute ChExMix run: java -jar $CHEXMIX_JAR\n")
