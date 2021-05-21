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

local home = os.getenv("HOME") or ""
local chexmix = pathJoin(home, "projects/def-robertf/apps/chexmix/0.5")
local chexmix_jar = pathJoin(chexmix, "chexmix_v0.5.jar")
setenv("CHEXMIX_BASE", chexmix)
setenv("CHEXMIX_JAR", chexmix_jar)
io.stderr:write("To execute ChExMix run: java -jar $CHEXMIX_JAR\n")
