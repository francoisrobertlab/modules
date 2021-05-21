help([[
For detailed instructions, go to:
    https://github.com/BradleyDickson/siQ-ChIP.git

This module sets the following environment variables:
    SIQ_CHIP_BASE:  directory containing siQ-ChIP
]])

whatis("Version: 1.0.0")
whatis("Keywords: NGS, Quantitative ChIP-seq")
whatis("URL: https://github.com/BradleyDickson/siQ-ChIP.git")
whatis("Description: Sans spike-in Quantitative ChIP-seq")

prereq(atleast("StdEnv","2018.3"))

local home = os.getenv("HOME") or ""
local siqchip = pathJoin(home, "projects/def-robertf/app/siQ-ChIP/1.0.0")
setenv("SIQ_CHIP_BASE", siqchip)
