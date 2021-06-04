help([[
Version of BWA used for Celia Jeronimo's samples analysis in 2019.
    https://github.com/francoisrobertlab/chipexo-cj2019
]])

whatis("Version: 1.0.0")
whatis("Keywords: NGS, Utility")
whatis("URL: https://github.com/francoisrobertlab/chipexo-cj2019")
whatis("Description: Version of BWA used for Celia Jeronimo's samples analysis in 2019")

always_load("nixpkgs/16.09")
always_load("gcc/7.3.0")
always_load("python/3.7.4")
always_load("bwa/0.7.17")
always_load("callnucleosomes/0.1-e5b433d")
always_load("samtools/1.8")
always_load("robtools/core/1.0")
