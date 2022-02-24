#!/bin/bash

# Stop on errors.
set -e

# cd to script directory
script_path=$(dirname "$0")
cd "$script_path" || { echo "Folder $script_path does not exists"; exit 1; }

# Commons functions
source ../commons.sh

version=$1
validate_module_version "$version" vap

# Load module and requirements.
module purge
if [ -z "$version" ]
then
  module load vap
else
  module load vap/"$version"
fi


clean_module_dir "$VAP"
echo "Installing VAP in folder $VAP"
cd "$VAP" || { echo "Folder $VAP does not exists"; exit 1; }
VAP_EXEC=vap_core_"$VAP_VERSION"_linux64
wget -nv https://bitbucket.org/labjacquespe/vap_core/downloads/"$VAP_EXEC"
mv "$VAP_EXEC" vap
chmod 755 vap
