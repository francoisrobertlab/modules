#!/bin/bash

# Stop on errors.
set -e

# cd to script directory
script_path=$(dirname "$0")
cd "$script_path" || { echo "Folder $script_path does not exists"; exit 1; }

# Commons functions
source ../commons.sh

version=$1
validate_module_version "$version" cutadapt

# Load module and requirements.
module purge
if [ -z "$version" ]
then
  module load StdEnv/2020 python/3.9.6 cutadapt
else
  module load StdEnv/2020 python/3.9.6 cutadapt/"$version"
fi


clean_module_dir "$CUTADAPT"
echo "Installing Cutadapt in folder $CUTADAPT"
cd "$CUTADAPT" || { echo "Folder $CUTADAPT does not exists"; exit 1; }

# Create python virtual environment.
venv="$CUTADAPT"/venv
echo "Creating python virtual environment at $venv"
python3 -m venv "$venv"
echo "Installing dependencies"
"$venv"/bin/pip install cutadapt=="$CUTADAPT_VERSION"

# Fix shebang for python files.
wrapper="$venv/bin/cutadapt_python_wrapper.sh"
write_python_shebang_wrapper "$wrapper" "\$CUTADAPT/venv/bin/python3"
fix_python_shebang "$venv/bin" $(basename "$wrapper")
