help([[
For detailed instructions, go to:
    https://www.bioconductor.org/packages/release/bioc/html/ChIPexoQual.html

This module sets the following environment variables:
    CHIPEXOQUAL_BASE:  directory containing ChIPexoQual
    R_LIBS_USER:       sets R library directory to use ChIPexoQual
    R_PROFILE_USER:    allows to configure CPAN automatically

This module loads the following modules:
    - r/4.0.2

You will need to load all module(s) on any one of the lines below before the "chipexoqual" module is available to load.
    gcc/7.3.0
]])

whatis("Version: 1.0 or later, but before 1,1")
whatis("Keywords: ChIPexoQual, Utility")
whatis("URL: https://www.bioconductor.org/packages/release/bioc/html/ChIPexoQual.html")
whatis("Description: Quality control pipeline for ChIP-exo/nexus data.")

prereq("gcc/7.3.0")
always_load("r/4.0.2")

local home = os.getenv("HOME") or ""
local base = pathJoin(home, "projects/def-robertf/robertlab-apps/chipexoqual/1.12.0")
prepend_path("PATH", base)
setenv("CHIPEXOQUAL_BASE", base)
setenv("R_LIBS_USER", pathJoin(base,"libs"))
setenv("R_PROFILE_USER", pathJoin(base,".Rprofile"))

