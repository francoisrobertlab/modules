#!/bin/bash

if [ -z "$CHIPEXOQUAL" ]
then
  echo "CHIPEXOQUAL environment variable must be defined, please load a 'chipexoqual' module"
  exit 1
fi


if [ -d "$CHIPEXOQUAL" ]
then
  echo "Deleting old folder $CHIPEXOQUAL"
  rm -rf "$CHIPEXOQUAL"
fi
echo "Installing ChIPexoQual in folder $CHIPEXOQUAL"
mkdir -p "$CHIPEXOQUAL"
cd "$CHIPEXOQUAL" || { echo "Folder $CHIPEXOQUAL does not exists"; exit 1; }
echo "Cloning chipexoqual from francoisrobertlab in folder $CHIPEXOQUAL"
git clone https://github.com/francoisrobertlab/chipexoqual.git .
echo "Checking out version $CHIPEXOQUAL_SCRIPT_VERSION"
git checkout "$CHIPEXOQUAL_SCRIPT_VERSION"

# Install ChIPexoQual R package.
echo "Installing ChIPexoQual R package"
Rscript -e 'BiocManager::install("ChIPexoQual")'
