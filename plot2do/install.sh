#!/bin/bash

# Stop on errors.
set -e

# cd to script directory
script_path=$(dirname "$0")
cd "$script_path" || { echo "Folder $script_path does not exists"; exit 1; }

# Commons functions
source ../commons.sh

version=$1
validate_module_version "$version" plot2do

# Load module and requirements.
module purge
if [ -z "$version" ]
then
  module load StdEnv/2018.3 plot2do
else
  module load StdEnv/2018.3 plot2do/"$version"
fi


clean_module_dir "$PLOT2DO"
echo "Installing plot2DO in folder $PLOT2DO"
cd "$PLOT2DO" || { echo "Folder $PLOT2DO does not exists"; exit 1; }
git clone https://github.com/rchereji/plot2DO.git .
echo "Checking out version $PLOT2DO_VERSION"
if [ "$PLOT2DO_VERSION" == "1.0-87fadb4" ] || [ "$PLOT2DO_VERSION" == "1.0-87fadb4-pre2021" ]
then
  git checkout 87fadb4acd23214f83e5440b0ccb02c623fa62d9
else
  git checkout "$PLOT2DO_VERSION"
fi
cp "$PLOT2DO_MODULE"/heatmap.R "$PLOT2DO"
cp "$PLOT2DO_MODULE"/plot2DO_export_matrix.R "$PLOT2DO"

mkdir -p "$PLOT2DO/libs"
if [ "$PLOT2DO_VERSION" == "1.0-87fadb4-pre2021" ]
then
  cp "$PLOT2DO_MODULE"/plot2do_setup.sh "$PLOT2DO"
  echo ""
  echo ""
  echo "Run the following commands to install plot2DO libraries:"
  echo "    Replace \$project with the name of your project"
  echo "    Replace \$email with your email address"
  echo ""
  echo "cd $PLOT2DO"
  echo "sbatch --account=\$project --mail-user=\$email --mail-type=ALL plot2do_setup.sh"
else
  # Install plot2DO R package and requirements.
  echo "Installing plot2DO R package"
  Rscript plot2DO_setup.R
fi
