#!/bin/bash

# Stop on errors.
set -e

# cd to script directory
script_path=$(dirname "$0")
cd "$script_path" || { echo "Folder $script_path does not exists"; exit 1; }

# Commons functions
source ../commons.sh

version=$1
validate_module_version "$version" chipseqspikeinfree

# Load module and requirements.
module purge
if [ -z "$version" ]
then
  module load StdEnv/2020 gcc/9.3.0 r-bundle-bioconductor/3.17 chipseqspikeinfree
else
  module load StdEnv/2020 gcc/9.3.0 r-bundle-bioconductor/3.17 chipseqspikeinfree/"$version"
fi


version=$CHIPSEQSPIKEINFREE_VERSION

clean_module_dir "$CHIPSEQSPIKEINFREE"
echo "Installing ChIPseqSpikeInFree in folder $CHIPSEQSPIKEINFREE"
cd "$CHIPSEQSPIKEINFREE" || { echo "Folder $CHIPSEQSPIKEINFREE does not exists"; exit 1; }

echo "Installing ChIPseqSpikeInFree R package"
mkdir -p "$CHIPSEQSPIKEINFREE/libs"
Rscript -e "install.packages('optparse', repos='https://mirror.csclub.uwaterloo.ca/CRAN/')"
Rscript -e "install.packages('devtools', repos='https://mirror.csclub.uwaterloo.ca/CRAN/')"
Rscript -e "library(devtools)" -e "devtools::install_github('stjude/ChIPseqSpikeInFree@${version}')"
