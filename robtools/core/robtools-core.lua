help([[
For detailed instructions, go to:
    https://github.com/francoisrobertlab/robtools

You will need to load all the following module(s) before the "robtools-core" module is available to load.
    - python/3.5.4 or greater
]])

whatis("Version: 2.0")
whatis("Keywords: NGS, Utility")
whatis("URL: https://github.com/francoisrobertlab/robtools")
whatis("Description: Tools to analyze next-generation sequencing (NGS) data")

prereq(atleast("python","3.5.4"))

local home = os.getenv("HOME") or ""
local project = pathJoin(home, "projects/def-robertf")
local robtools = pathJoin(project, "robtools")
prepend_path("PATH", pathJoin(robtools, "bash"))
prepend_path("PATH", pathJoin(robtools, "venv/bin"))
setenv("ROBTOOLS", robtools)
