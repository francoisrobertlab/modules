#!/bin/bash

# Stop on errors.
set -e

# cd to script directory
script_path=$(dirname "$0")
cd "$script_path" || { echo "Folder $script_path does not exists"; exit 1; }

# Commons functions
source ../commons.sh

version=$1
validate_module_version "$version" homer

# Load module and requirements.
module purge
if [ -z "$version" ]
then
  module load StdEnv/2020 homer
else
  module load StdEnv/2020 homer/"$version"
fi


clean_module_dir "$HOMER"
echo "Installing ChIPexoQual in folder $HOMER"
cd "$HOMER" || { echo "Folder $HOMER does not exists"; exit 1; }
wget -nv http://homer.ucsd.edu/homer/configureHomer.pl
perl configureHomer.pl -install -version "v$HOMER_VERSION"
