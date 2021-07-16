help([[
Version of BWA used for Celia Jeronimo's samples analysis in 2019.
    https://github.com/francoisrobertlab/chipexo-cj2019
]])

whatis("Version: 1.0.0")
whatis("Keywords: NGS, Utility")
whatis("URL: https://github.com/francoisrobertlab/chipexo-cj2019")
whatis("Description: Version of BWA used for Celia Jeronimo's samples analysis in 2019")

depends_on("nixpkgs/16.09")
depends_on("gcc/7.3.0")
depends_on("python/3.7.4")
depends_on("bwa/0.7.17")
depends_on("callnucleosomes/0.1-e5b433d")
depends_on("samtools/1.8")
depends_on("robtools/core/1.0")
