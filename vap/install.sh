#!/bin/bash

if [ -z "$VAP" ]
then
  echo "VAP environment variable must be defined, please load a 'vap' module"
  exit 1
fi


if [ -d "$VAP" ]
then
  echo "Deleting old folder $VAP"
  rm -rf "$VAP"
fi
echo "Installing VAP in folder $VAP"
mkdir -p "$VAP"
cd "$VAP" || { echo "Folder $VAP does not exists"; exit 1; }
VAP_EXEC=vap_core_"$VAP_VERSION"_linux64
wget https://bitbucket.org/labjacquespe/vap_core/downloads/"$VAP_EXEC"
mv "$VAP_EXEC" vap
chmod 755 vap
