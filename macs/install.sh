#!/bin/bash

# Stop on errors.
set -e

# cd to script directory
script_path=$(dirname "$0")
cd "$script_path" || { echo "Folder $script_path does not exists"; exit 1; }

# Commons functions
source ../commons.sh

version=$1
validate_module_version "$version" macs

# Load module and requirements.
module purge
if [ -z "$version" ]
then
  module load StdEnv/2020 macs
else
  module load StdEnv/2020 macs/"$version"
fi


clean_module_dir "$MACS"
echo "Installing MACS in folder $MACS"
cd "$MACS" || { echo "Folder $MACS does not exists"; exit 1; }

# Load python module
if [ "$MACS_VERSION" == "2.2.8" ]
then
  module load python/3.11.2
fi

# Create python virtual environment.
venv="$MACS"/venv
echo "Creating python virtual environment at $venv"
python3 -m venv "$venv"
echo "Installing dependencies"
"$venv"/bin/pip install MACS2=="$MACS_VERSION"

# Fix shebang for python files.
wrapper="$venv/bin/macs_python_wrapper.sh"
write_python_shebang_wrapper "$wrapper" "\$MACS/venv/bin/python3"
fix_python_shebang "$venv/bin" $(basename "$wrapper")
