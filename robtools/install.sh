#!/bin/bash

if [ -z "$ROBTOOLS" ]
then
  echo "ROBTOOLS environment variable must be defined, please load a 'robtools' module"
  exit 1
fi


# Clone robtools, if not already cloned.
if [ ! -d "$ROBTOOLS" ]
then
  echo "Creating folder $ROBTOOLS"
  mkdir -p "$ROBTOOLS"
fi
cd "$ROBTOOLS" || { echo "Folder $ROBTOOLS does not exists"; exit 1; }
if [ ! -d "$ROBTOOLS/.git" ]
then
  echo "Cloning robtools in folder $ROBTOOLS"
  git clone https://github.com/francoisrobertlab/robtools.git .
fi
echo "Checking out version $ROBTOOLS_VERSION"
if [ "$ROBTOOLS_VERSION" == "2.0" ]
then
  git checkout master
elif [ "$ROBTOOLS_VERSION" == "1.2" ]
then
  git checkout hotfix-1.2
else
  git checkout "$ROBTOOLS_VERSION"
fi

# Create python virtual environment.
VENV="$ROBTOOLS"/venv
if [ ! -d "$VENV" ]
then
  echo "Creating python virtual environment at $VENV"
  python3 -m venv "$VENV"
fi
VERSION=$(git --git-dir="$ROBTOOLS"/.git rev-parse --abbrev-ref HEAD)
echo "Updating python libraries using $VERSION"
"$VENV"/bin/pip uninstall -y RobTools
"$VENV"/bin/pip install git+file://"$ROBTOOLS"@"$VERSION"
find "$VENV" -type f -perm 750 -exec sed -i "1 s|^.*$|#!/usr/bin/env python3|g" {} \;
