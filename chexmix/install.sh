#!/bin/bash

# Stop on errors.
set -e

# cd to script directory
script_path=$(dirname "$0")
cd "$script_path" || { echo "Folder $script_path does not exists"; exit 1; }

# Commons functions
source ../commons.sh

version=$1
validate_module_version "$version" chexmix

# Load module and requirements.
module purge
if [ -z "$version" ]
then
  module load StdEnv/2020 chexmix
else
  module load StdEnv/2020 chexmix/"$version"
fi


clean_module_dir "$CHEXMIX"
echo "Installing ChExMix in folder $CHEXMIX"
cd "$CHEXMIX" || { echo "Folder $CHEXMIX does not exists"; exit 1; }
wget -nv http://lugh.bmb.psu.edu/software/chexmix/chexmix_v"$CHEXMIX_VERSION".jar
