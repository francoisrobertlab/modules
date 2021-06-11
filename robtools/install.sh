#!/bin/bash

if [ -z "$ROBTOOLS" ]
then
  echo "ROBTOOLS environment variable must be defined, please load a 'robtools' module"
  exit 1
fi


if [ -d "$ROBTOOLS" ]
then
  echo "Deleting old folder $ROBTOOLS"
  rm -rf "$ROBTOOLS"
fi
echo "Installing robtools in folder $ROBTOOLS"
mkdir -p "$ROBTOOLS"
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
VENV="$ROBTOOLS"/venv
echo "Creating python virtual environment at $VENV"
python3 -m venv "$VENV"
VERSION=$(git --git-dir="$ROBTOOLS"/.git rev-parse --abbrev-ref HEAD)
echo "Updating python libraries using $VERSION"
"$VENV"/bin/pip install git+file://"$ROBTOOLS"@"$VERSION"
VENV_REAL=$(dirname $(readlink -f "$VENV"))
find "$VENV" -type f -perm 750 -exec sed -i "1 s|^.*$|#!$VENV_REAL/bin/python3|g" {} \;
