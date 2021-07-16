help([[
For detailed instructions, go to:
    https://github.com/francoisrobertlab/robtools

This module sets the following environment variables:
    TRIMMOMATIC_JAR:       Trimmomatic jar file
    TRIMMOMATIC_ADAPTERS:  Folder containing Trimmomatic adapters sequences

This module loads the following modules and their requirements:
    - robtools/core/2.0
    - python/3.7.4
    - java/1.8.0_121
    - fastqc/0.11.8
    - trimmomatic/0.36
    - bwa/0.7.17
    - bowtie2/2.3.4.3
    - samtools/1.9
    - bedtools/2.27.1
    - kentutils/20180716
    - sra-toolkit/2.9.6
    - vap/1.1.0
]])

whatis("Version: 2.0")
whatis("Keywords: NGS, Utility")
whatis("URL: https://github.com/francoisrobertlab/robtools")
whatis("Description: Tools to analyze next-generation sequencing (NGS) data")

depends_on("StdEnv/2018.3")
depends_on("gcc/7.3.0")
depends_on("python/3.7.4")
depends_on("java/1.8.0_121")
depends_on("fastqc/0.11.8")
depends_on("trimmomatic/0.36")
depends_on("bwa/0.7.17")
depends_on("bowtie2/2.3.4.3")
depends_on("samtools/1.9")
depends_on("bedtools/2.27.1")
depends_on("sra-toolkit/2.9.6")
depends_on("kentutils/20180716")
depends_on("vap/1.1.0")
depends_on("robtools/core/2.0")

local trimmomatic_home = os.getenv("EBROOTTRIMMOMATIC") or ""
setenv("TRIMMOMATIC_JAR", pathJoin(trimmomatic_home, "trimmomatic-0.36.jar"))
setenv("TRIMMOMATIC_ADAPTERS", pathJoin(trimmomatic_home, "adapters"))
