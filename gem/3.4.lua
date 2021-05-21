help([[
For detailed instructions, go to:
    https://groups.csail.mit.edu/cgs/gem/

This module sets the following environment variables:
    GEM_BASE:  directory containing GEM and default read distributions files
    GEM_JAR:   GEM jar file

This module loads the following modules and their requirements:
    - java/1.8.0_191
]])

whatis("Version: 3.4")
whatis("Keywords: NGS, Peak Calling")
whatis("URL: https://groups.csail.mit.edu/cgs/gem/")
whatis("Description: GEM: High resolution peak calling and motif discovery for ChIP-seq and ChIP-exo data")

always_load("StdEnv/2020")
always_load("java/1.8.0_192")

local home = os.getenv("HOME") or ""
local gem = pathJoin(home, "projects/def-robertf/robertlab-apps/gem/3.4")
local gem_jar = pathJoin(gem, "gem.jar")
setenv("GEM_BASE", gem)
setenv("GEM_JAR", gem_jar)
io.stderr:write("To execute GEM run: java -jar $GEM_JAR\n")
