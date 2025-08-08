#!/bin/bash

# Stop on errors.
set -e

# cd to script directory
script_path=$(dirname "$0")
cd "$script_path" || { echo "Folder $script_path does not exists"; exit 1; }

# Commons functions
source ../commons.sh

version=$1
validate_module_version "$version" hisat-3n

# Load module and requirements.
module purge
if [ -z "$version" ]
then
  module load StdEnv/2023 hisat-3n
else
  module load StdEnv/2023 hisat-3n/"$version"
fi


clean_module_dir "$HISAT3N"
echo "Installing HISAT-3N in folder $HISAT3N"
cd "$HISAT3N" || { echo "Folder $HISAT3N does not exists"; exit 1; }
echo "Cloning HISAT-3N in folder $source"
git clone https://github.com/DaehwanKimLab/hisat2.git .
git checkout -b hisat-3n origin/hisat-3n
git checkout "$HISAT3N_COMMIT"
make
cd ..
