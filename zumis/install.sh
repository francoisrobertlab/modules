#!/bin/bash

# Stop on errors.
set -e

# cd to script directory
script_path=$(dirname "$0")
cd "$script_path" || { echo "Folder $script_path does not exists"; exit 1; }

# Commons functions
source ../commons.sh

version=$1
validate_module_version "$version" zumis

# Load module and requirements.
module purge
module load StdEnv/2020 perl/5.30.2 samtools/1.15.1 star/2.7.9a python/3.10.2
module load gcc/9.3.0 r-bundle-bioconductor/3.14
if [ -z "$version" ]
then
  module load zumis
else
  module load zumis/"$version"
fi


clean_module_dir "$ZUMIS"
echo "Installing zUMIs in folder $ZUMIS"
cd "$ZUMIS" || { echo "Folder $ZUMIS does not exists"; exit 1; }
git clone https://github.com/sdparekh/zUMIs.git .
echo "Checking out version $ZUMIS_VERSION"
if [ "$ZUMIS_VERSION" == "2.9.7c" ]
then
  git checkout cbd54c04d8df1b22b7d8d2984104f1e00bf053f8
else
  git checkout "$ZUMIS_VERSION"
fi

# Create python virtual environment.
venv="$ZUMIS"/venv
echo "Creating python virtual environment at $venv"
python3 -m venv "$venv"
"$venv"/bin/pip install pysam

# Install zUMIs R packages.
echo "Installing zUMIs R packages"
mkdir -p "$ZUMIS/libs"
Rscript "${ZUMIS_MODULE}/zumis_install_packages.R"
