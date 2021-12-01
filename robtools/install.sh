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

# Fix shebang for python files.
find "$VENV/bin" -type f -executable -exec sed -i "1 s|^#\!.*$|#!/usr/bin/env robtools_python_wrapper.sh|g" {} \;
if [ -f "$VENV"/bin/robtools_python_wrapper.sh ]
then
  rm "$VENV"/bin/robtools_python_wrapper.sh
fi
{
  echo '#!/bin/bash'
  echo 'python="$ROBTOOLS"/venv/bin/python3'
  echo 'exec "$python" "$@"'
} >> "$VENV"/bin/robtools_python_wrapper.sh
chmod 755 "$VENV"/bin/robtools_python_wrapper.sh

# Get project name.
if [ -d "$HOME"/projects ]
then
  robtools=$(readlink -f "$ROBTOOLS")
  for project in "$HOME"/projects/*
  do
    project_path=$(readlink -f "$project")
    if [[ $robtools == $project_path/* ]]
    then
      account=$(basename $project)
    fi
  done
fi
if [ -n "$account" ]
then
  # Fix sbatch account in bash folder.
  echo "Changing sbatch account of bash scripts to $account"
  find bash -maxdepth 1 -type f -exec sed -i "s/^#SBATCH --account=.*$/#SBATCH --account=$account/g" {} \;
else
  echo "Could not find sbatch account, bash scripts will use 'def-robertf' as account"
fi
