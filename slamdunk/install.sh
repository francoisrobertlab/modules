#!/bin/bash

# Stop on errors.
set -e

# cd to script directory
script_path=$(dirname "$0")
cd "$script_path" || { echo "Folder $script_path does not exists"; exit 1; }

# Commons functions
source ../commons.sh

version=$1
validate_module_version "$version" slamdunk

# Load module and requirements.
module purge
if [ -z "$version" ]
then
  module load StdEnv/2023 apptainer/1 slamdunk
else
  module load StdEnv/2023 apptainer/1 slamdunk/"$version"
fi


version=$SLAMDUNK_VERSION

clean_module_dir "$SLAMDUNK"
echo "Installing slamdunk in folder $SLAMDUNK"
cd "$SLAMDUNK" || { echo "Folder $SLAMDUNK does not exists"; exit 1; }
container=slamdunk-"$SLAMDUNK_VERSION".sif
wget -nv --no-check-certificate https://datahub-851-cs3.p.genap.ca/slamdunk/"$container"
