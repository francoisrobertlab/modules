help([[
For detailed instructions, go to:
    https://github.com/srinivasramachandran/CallNucleosomes

This module loads the following modules and their requirements:
    - perl/5.22.4
]])

whatis("Version: 0.1")
whatis("Keywords: NGS, Nucleosomes Calling")
whatis("URL: https://github.com/srinivasramachandran/CallNucleosomes")
whatis("Description: Calls nucleosomes position")

always_load("StdEnv/2018.3")
always_load("perl/5.22.4")

local home = os.getenv("HOME") or ""
local call_nucleosomes = pathJoin(home, "projects/def-robertf/robertlab-apps/CallNucleosomes/0.1")
prepend_path("PERL5LIB", pathJoin(call_nucleosomes, "perl_library"))
