#!/bin/bash

# Stop on errors.
set -e

# cd to script directory
script_path=$(dirname "$0")
cd "$script_path" || { echo "Folder $script_path does not exists"; exit 1; }

# Commons functions
source ../commons.sh

version=$1
validate_module_version "$version" txburst

# Load module and requirements.
module purge
module load StdEnv/2020
module load python/3.9.6
if [ -z "$version" ]
then
  module load txburst
else
  module load txburst/"$version"
fi


clean_module_dir "$TXBURST"
echo "Installing Smart-seq3 in folder $TXBURST"
cd "$TXBURST" || { echo "Folder $TXBURST does not exists"; exit 1; }
git clone https://github.com/sandberg-lab/txburst.git .
echo "Checking out version $TXBURST_VERSION"
if [ "$TXBURST_VERSION" == "0.1-0146527" ]
then
  git checkout 01465274a0d7fcaa190037d66fa274bc04a81eb0
else
  git checkout "$TXBURST_VERSION"
fi

venv="$TXBURST"/venv
echo "Creating python virtual environment at $venv"
python3 -m venv "$venv"
xargs "$venv/bin/pip" install <<< "$TXBURST_PIP"
