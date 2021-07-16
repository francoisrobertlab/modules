help([[
For detailed instructions, go to:
    https://github.com/francoisrobertlab/robtools

This module loads the following modules and their requirements:
    - robtools/core/1.0
    - python/3.7.4
    - perl/5.22.4
    - fastqc/0.11.8
    - bwa/0.7.17
    - bowtie2/2.3.4.3
    - samtools/1.9
    - bedtools/2.27.1
    - sra-toolkit/2.9.6
    - kentutils/20180716
    - vap/1.1.0
    - plot2do/1.0-87fadb4
]])

whatis("Version: 1.0")
whatis("Keywords: NGS, Utility")
whatis("URL: https://github.com/francoisrobertlab/robtools")
whatis("Description: Tools to analyze next-generation sequencing (NGS) data")

depends_on("StdEnv/2018.3")
depends_on("gcc/7.3.0")
depends_on("python/3.7.4")
depends_on("perl/5.22.4")
depends_on("fastqc/0.11.8")
depends_on("bwa/0.7.17")
depends_on("bowtie2/2.3.4.3")
depends_on("samtools/1.9")
depends_on("bedtools/2.27.1")
depends_on("sra-toolkit/2.9.6")
depends_on("kentutils/20180716")
depends_on("vap/1.1.0")
depends_on("robtools/core/1.0")
depends_on("plot2do/1.0-87fadb4")
