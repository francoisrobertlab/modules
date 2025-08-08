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
module load StdEnv/2020
if [ -z "$version" ]
then
  module load star
else
  module load star/"$version"
fi


clean_module_dir "$STAR"
echo "Installing STAR in folder $STAR"
cd "$STAR" || { echo "Folder $STAR does not exists"; exit 1; }
git clone https://github.com/alexdobin/STAR.git .
echo "Checking out version $STAR_VERSION"
git checkout "$STAR_VERSION"
cd source || { echo "Folder $STAR/source does not exists"; exit 1; }
make STAR
cd ..
ln -f source/STAR STAR
