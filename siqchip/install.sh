#!/bin/bash

# Stop on errors.
set -e

# cd to script directory
script_path=$(dirname "$0")
cd "$script_path" || { echo "Folder $script_path does not exists"; exit 1; }

# Commons functions
source ../commons.sh

version=$1
validate_module_version "$version" siqchip

# Load module and requirements.
module purge
if [ -z "$version" ]
then
  module load StdEnv/2020 siqchip
else
  module load StdEnv/2020 siqchip/"$version"
fi


clean_module_dir "$SIQCHIP"
echo "Installing siQ-ChIP in folder $SIQCHIP"
cd "$SIQCHIP" || { echo "Folder $SIQCHIP does not exists"; exit 1; }
git clone https://github.com/BradleyDickson/siQ-ChIP.git .
echo "Checking out version $SIQCHIP_VERSION"
git checkout "v$SIQCHIP_VERSION"
