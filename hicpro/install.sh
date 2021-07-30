#!/bin/bash

if [ -z "$HICPRO" ]
then
  echo "HICPRO environment variable must be defined, please load a 'hicpro' module"
  exit 1
fi


if [ -d "$HICPRO" ]
then
  echo "Deleting old folder $HICPRO"
  rm -rf "$HICPRO"
fi
echo "Installing HiC-Pro in folder $HICPRO"
mkdir -p "$HICPRO"
cd "$HICPRO" || { echo "Folder $HICPRO does not exists"; exit 1; }
SOURCE="$HICPRO"/source
echo "Cloning HiC-Pro in folder $SOURCE"
git clone https://github.com/nservant/HiC-Pro.git "$SOURCE"
cd "$SOURCE" || { echo "Folder $SOURCE does not exists"; exit 1; }
echo "Checking out version v$HICPRO_VERSION"
git checkout v"$HICPRO_VERSION"
cd ..

# Create python virtual environment.
VENV="$HICPRO"/venv
echo "Creating python virtual environment at $VENV"
python3 -m venv "$VENV"
echo "Installing dependencies"
"$VENV"/bin/pip install pysam bx-python numpy scipy pandas iced

# Installing HiC-Pro.
cd "$SOURCE" || { echo "Folder $SOURCE does not exists"; exit 1; }
sed -i "s:PREFIX.*:PREFIX = $HICPRO:" config-install.txt
sed -i "s:CLUSTER_SYS.*:CLUSTER_SYS = SLURM:" config-install.txt
make configure
make install
cd ..
rm -rf "$SOURCE"

# Fix shebang for python files.
UTILS="$HICPRO/HiC-Pro_$HICPRO_VERSION"/bin/utils
VENV_REAL=$(readlink -f "$VENV")
find "$VENV/bin" -type f -executable -exec sed -i "1 s|^#\!.*$|#!$VENV_REAL/bin/python3|g" {} \;
find "$UTILS" -type f -executable -exec sed -i "1 s|^#\!.*$|#!$VENV_REAL/bin/python3|g" {} \;
