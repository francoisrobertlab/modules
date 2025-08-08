#!/bin/bash

# Stop on errors.
set -e

# cd to script directory
script_path=$(dirname "$0")
cd "$script_path" || { echo "Folder $script_path does not exists"; exit 1; }

# Commons functions
source ../commons.sh

version=$1
validate_module_version "$version" gem

# Load module and requirements.
module purge
if [ -z "$version" ]
then
  module load StdEnv/2020 gem
else
  module load StdEnv/2020 gem/"$version"
fi


clean_module_dir "$GEM"
echo "Installing GEM in folder $GEM"
cd "$GEM" || { echo "Folder $GEM does not exists"; exit 1; }
gem_tar=gem.v"$GEM_VERSION".tar.gz
wget -nv https://groups.csail.mit.edu/cgs/gem/download/"$gem_tar"
tar -xf "$gem_tar"
rm "$gem_tar"
mv gem/* .
rmdir gem
