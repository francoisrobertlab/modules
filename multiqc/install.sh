#!/bin/bash

# Stop on errors.
set -e

# cd to script directory
script_path=$(dirname "$0")
cd "$script_path" || { echo "Folder $script_path does not exists"; exit 1; }

# Commons functions
source ../commons.sh

version=$1
validate_module_version "$version" multiqc

# Load module and requirements.
module purge
if [ -z "$version" ]
then
  module load StdEnv/2020 python/3.9.6 multiqc
else
  module load StdEnv/2020 python/3.9.6 multiqc/"$version"
fi


clean_module_dir "$MULTIQC"
echo "Installing MultiQC in folder $MULTIQC"
cd "$MULTIQC" || { echo "Folder $MULTIQC does not exists"; exit 1; }

# Create python virtual environment.
venv="$MULTIQC"/venv
echo "Creating python virtual environment at $venv"
python3 -m venv "$venv"
echo "Installing dependencies"
"$venv"/bin/pip install multiqc=="$MULTIQC_VERSION"

# Fix shebang for python files.
wrapper="$venv/bin/multiqc_python_wrapper.sh"
write_python_shebang_wrapper "$wrapper" "\$MULTIQC/venv/bin/python3"
fix_python_shebang "$venv/bin" $(basename "$wrapper")
