#!/bin/bash

# Stop on errors.
set -e

# cd to script directory
script_path=$(dirname "$0")
cd "$script_path" || { echo "Folder $script_path does not exists"; exit 1; }

# Commons functions
source ../commons.sh

version=$1
validate_module_version "$version" deeptools

# Load module and requirements.
module purge
module load StdEnv/2020
module load python/3.9.6
if [ -z "$version" ]
then
  module load deeptools
else
  module load deeptools/"$version"
fi


clean_module_dir "$DEEPTOOLS"
echo "Installing deeptools in folder $DEEPTOOLS"
cd "$DEEPTOOLS" || { echo "Folder $DEEPTOOLS does not exists"; exit 1; }

venv="$DEEPTOOLS"/venv
echo "Creating python virtual environment at $venv"
python3 -m venv "$venv"
"$venv/bin/pip" install "deeptools==$DEEPTOOLS_VERSION"

# Fix shebang for python files.
wrapper="$venv/bin/deeptools_python_wrapper.sh"
write_python_shebang_wrapper "$wrapper" "\$DEEPTOOLS/venv/bin/python3"
fix_python_shebang "$venv/bin" $(basename "$wrapper")
