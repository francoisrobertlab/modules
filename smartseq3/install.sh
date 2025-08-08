#!/bin/bash

# Stop on errors.
set -e

# cd to script directory
script_path=$(dirname "$0")
cd "$script_path" || { echo "Folder $script_path does not exists"; exit 1; }

# Commons functions
source ../commons.sh

version=$1
validate_module_version "$version" smartseq3

# Load module and requirements.
module purge
module load StdEnv/2020
module load gcc/9.3.0 r-bundle-bioconductor/3.14
module load python/3.9.6
if [ -z "$version" ]
then
  module load smartseq3
else
  module load smartseq3/"$version"
fi


clean_module_dir "$SMARTSEQ3"
echo "Installing Smart-seq3 in folder $SMARTSEQ3"
cd "$SMARTSEQ3" || { echo "Folder $SMARTSEQ3 does not exists"; exit 1; }
git clone --recurse-submodules https://github.com/sandberg-lab/Smart-seq3.git .
echo "Checking out version $SMARTSEQ3_VERSION"
if [ "$SMARTSEQ3_VERSION" == "0.1-5d59384" ]
then
  git checkout 5d5938475039f5c98d0d94faf89db917f66fe8ac
else
  git checkout "$SMARTSEQ3_VERSION"
fi

venv="$SMARTSEQ3"/venv
echo "Creating python virtual environment at $venv"
python3 -m venv "$venv"
xargs "$venv/bin/pip" install <<< "$SMARTSEQ3_PIP"

echo "Installing Smart-seq3 R packages"
mkdir -p "$SMARTSEQ3/libs"
Rscript "${SMARTSEQ3_MODULE}/smartseq3_install_packages.R"
