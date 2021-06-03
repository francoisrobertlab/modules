#!/bin/bash

if [ -z "$CHIPEXOQUAL" ]
then
  echo "CHIPEXOQUAL environment variable must be defined, please load a 'chipexoqual' module"
  exit 1
fi


# Clone chipexoqual from francoisrobertlab, if not already cloned.
if [ ! -d "$CHIPEXOQUAL" ]
then
  echo "Creating folder $CHIPEXOQUAL"
  mkdir -p "$CHIPEXOQUAL"
fi
cd "$CHIPEXOQUAL" || { echo "Folder $CHIPEXOQUAL does not exists"; exit 1; }
if [ ! -d "$CHIPEXOQUAL/.git" ]
then
  echo "Cloning chipexoqual from francoisrobertlab in folder $CHIPEXOQUAL"
  git clone https://github.com/francoisrobertlab/chipexoqual.git .
fi
echo "Checking out version $CHIPEXOQUAL_SCRIPT_VERSION"
git checkout "$CHIPEXOQUAL_SCRIPT_VERSION"

# Install ChIPexoQual R package.
if [ ! -d "$CHIPEXOQUAL/libs" ]
then
  echo "Creating folder $CHIPEXOQUAL"
  mkdir -p "$CHIPEXOQUAL/libs"
fi
echo "Installing ChIPexoQual R package"
Rscript -e 'BiocManager::install("ChIPexoQual")'
