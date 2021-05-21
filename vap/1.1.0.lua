help([[
For detailed instructions, go to:
    http://lab-jacques.recherche.usherbrooke.ca/software_en/vap/
    https://bitbucket.org/labjacquespe/vap
]])

whatis("Version: 1.1.0")
whatis("Keywords: VAP, Utility")
whatis("URL: https://bitbucket.org/labjacquespe/vap")
whatis("Description: Versatile Aggregate Profiler (VAP)")

local home = os.getenv("HOME") or ""
local base = pathJoin(home, "projects/def-robertf/apps/vap/1.1.0")
prepend_path("PATH", base)
