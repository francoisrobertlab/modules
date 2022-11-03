#!/bin/bash

# Stop on errors.
set -e

# cd to script directory
script_path=$(dirname "$0")
cd "$script_path" || { echo "Folder $script_path does not exists"; exit 1; }

# Commons functions
source ../commons.sh

version=$1
validate_module_version "$version" snpsplit

# Load module and requirements.
module purge
if [ -z "$version" ]
then
  module load StdEnv/2020 snpsplit
else
  module load StdEnv/2020 snpsplit/"$version"
fi


clean_module_dir "$SNPSPLIT"
echo "Installing SNPsplit in folder $SNPSPLIT"
cd "$SNPSPLIT" || { echo "Folder $SNPSPLIT does not exists"; exit 1; }
git clone https://github.com/FelixKrueger/SNPsplit.git .
echo "Checking out version $SNPSPLIT_VERSION"
git checkout "$SNPSPLIT_VERSION"
