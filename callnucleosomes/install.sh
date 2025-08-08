#!/bin/bash

# Stop on errors.
set -e

# cd to script directory
script_path=$(dirname "$0")
cd "$script_path" || { echo "Folder $script_path does not exists"; exit 1; }

# Commons functions
source ../commons.sh

version=$1
validate_module_version "$version" callnucleosomes

# Load module and requirements.
module purge
if [ -z "$version" ]
then
  module load StdEnv/2018.3 callnucleosomes
elif [[ $version =~ ^0\..* ]]
then
  module load StdEnv/2018.3 callnucleosomes/"$version"
else
  module load StdEnv/2018.3 callnucleosomes/"$version"
fi


clean_module_dir "$CALLNUCLEOSOMES"
echo "Installing CallNucleosomes in folder $CALLNUCLEOSOMES"
cd "$CALLNUCLEOSOMES" || { echo "Folder $CALLNUCLEOSOMES does not exists"; exit 1; }
if [ "$CALLNUCLEOSOMES_VERSION" == "0.1-e5b433d" ]
then
  git clone https://github.com/francoisrobertlab/CallNucleosomes.git .
  echo "Checking out version $CALLNUCLEOSOMES_VERSION"
  git checkout e5b433d839eec8483348baedbc6a470215965e6f
else
  git clone https://github.com/srinivasramachandran/CallNucleosomes.git .
  echo "Checking out version $CALLNUCLEOSOMES_VERSION"
  git checkout "$CALLNUCLEOSOMES_VERSION"
fi
