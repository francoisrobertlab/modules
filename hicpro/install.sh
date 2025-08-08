#!/bin/bash

# Stop on errors.
set -e

# cd to script directory
script_path=$(dirname "$0")
cd "$script_path" || { echo "Folder $script_path does not exists"; exit 1; }

# Commons functions
source ../commons.sh

version=$1
validate_module_version "$version" hicpro

# Load module and requirements.
module purge
if [ -z "$version" ]
then
  module load StdEnv/2020 hicpro
else
  module load StdEnv/2020 hicpro/"$version"
fi


clean_module_dir "$HICPRO"
echo "Installing HiC-Pro in folder $HICPRO"
cd "$HICPRO" || { echo "Folder $HICPRO does not exists"; exit 1; }
source="$HICPRO"/source
echo "Cloning HiC-Pro in folder $source"
git clone https://github.com/nservant/HiC-Pro.git "$source"
cd "$source" || { echo "Folder $source does not exists"; exit 1; }
echo "Checking out version v$HICPRO_VERSION"
git checkout v"$HICPRO_VERSION"
cd ..

# Create python virtual environment.
venv="$HICPRO"/venv
echo "Creating python virtual environment at $venv"
python3 -m venv "$venv"
echo "Installing dependencies"
"$venv"/bin/pip install pysam bx-python numpy scipy pandas iced

# Installing HiC-Pro.
cd "$source" || { echo "Folder $source does not exists"; exit 1; }
sed -i "s:PREFIX.*:PREFIX = $HICPRO:" config-install.txt
sed -i "s:CLUSTER_SYS.*:CLUSTER_SYS = SLURM:" config-install.txt
make configure
make install
cd ..
rm -rf "$source"

# Fix shebang for python files.
wrapper="$venv/bin/hicpro_python_wrapper.sh"
write_python_shebang_wrapper "$wrapper" "\$HICPRO/venv/bin/python3"
fix_python_shebang "$venv/bin" $(basename "$wrapper")
fix_python_shebang "$HICPRO/HiC-Pro_$HICPRO_VERSION/bin/utils" $(basename "$wrapper")
