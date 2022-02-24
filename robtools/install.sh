#!/bin/bash

# Stop on errors.
set -e

# cd to script directory
script_path=$(dirname "$0")
cd "$script_path" || { echo "Folder $script_path does not exists"; exit 1; }

# Commons functions
source ../commons.sh

version=$1
validate_module_version "$version" robtools

# Load module and requirements.
module purge
if [ -z "$version" ]
then
  module load StdEnv/2018.3 robtools
else
  module load StdEnv/2018.3 robtools/"$version"
fi


clean_module_dir "$ROBTOOLS"
echo "Installing robtools in folder $ROBTOOLS"
cd "$ROBTOOLS" || { echo "Folder $ROBTOOLS does not exists"; exit 1; }
git clone https://github.com/francoisrobertlab/robtools.git .
echo "Checking out version $ROBTOOLS_VERSION"
if [ "$ROBTOOLS_VERSION" == "2.0" ]
then
  git checkout master
else
  git checkout "$ROBTOOLS_VERSION"
fi

# Create python virtual environment.
venv="$ROBTOOLS"/venv
echo "Creating python virtual environment at $venv"
python3 -m venv "$venv"
cloned_version=$(git --git-dir="$ROBTOOLS"/.git rev-parse --abbrev-ref HEAD)
"$venv"/bin/pip install git+file://"$ROBTOOLS"@"$cloned_version"

# Fix shebang for python files.
wrapper="$venv/bin/robtools_python_wrapper.sh"
write_python_shebang_wrapper "$wrapper" "\$ROBTOOLS/venv/bin/python3"
fix_python_shebang "$venv/bin" $(basename "$wrapper")

# Fix sbatch account in bash folder.
account=$(get_project_name)
echo "Changing sbatch account of bash scripts to $account"
find bash -maxdepth 1 -type f -exec sed -i "s/^#SBATCH --account=.*$/#SBATCH --account=$account/g" {} \;
