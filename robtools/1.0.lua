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

always_load("StdEnv/2018.3")
always_load("gcc/7.3.0")
always_load("python/3.7.4")
always_load("perl/5.22.4")
always_load("fastqc/0.11.8")
always_load("bwa/0.7.17")
always_load("bowtie2/2.3.4.3")
always_load("samtools/1.9")
always_load("bedtools/2.27.1")
always_load("sra-toolkit/2.9.6")
always_load("kentutils/20180716")
always_load("vap/1.1.0")
always_load("robtools/core/1.0")
always_load("plot2do/1.0-87fadb4")
