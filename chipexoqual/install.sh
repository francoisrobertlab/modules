#!/bin/bash

# Stop on errors.
set -e

# cd to script directory
script_path=$(dirname "$0")
cd "$script_path" || { echo "Folder $script_path does not exists"; exit 1; }

# Commons functions
source ../commons.sh

version=$1
validate_module_version "$version" chipexoqual

# Load module and requirements.
module purge
if [ -z "$version" ]
then
  module load StdEnv/2020 chipexoqual
else
  module load StdEnv/2020 chipexoqual/"$version"
fi


clean_module_dir "$CHIPEXOQUAL"
echo "Installing ChIPexoQual in folder $CHIPEXOQUAL"
cd "$CHIPEXOQUAL" || { echo "Folder $CHIPEXOQUAL does not exists"; exit 1; }
echo "Cloning chipexoqual from francoisrobertlab in folder $CHIPEXOQUAL"
git clone https://github.com/francoisrobertlab/chipexoqual.git .
echo "Checking out version $CHIPEXOQUAL_SCRIPT_VERSION"
git checkout "$CHIPEXOQUAL_SCRIPT_VERSION"

# Install ChIPexoQual R package.
echo "Installing ChIPexoQual R package"
mkdir -p "$CHIPEXOQUAL/libs"
Rscript -e "BiocManager::install('ChIPexoQual')"
Rscript -e "install.packages('optparse', repos='https://utstat.toronto.edu/cran/')"
