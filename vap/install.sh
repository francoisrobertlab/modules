#!/bin/bash

if [ -z "$VAP" ]
then
  echo "VAP environment variable must be defined, please load a 'vap' module"
  exit 1
fi


# Download VAP.
if [ ! -d "$VAP" ]
then
  echo "Creating folder $VAP"
  mkdir -p "$VAP"
fi
cd "$VAP" || { echo "Folder $VAP does not exists"; exit 1; }
echo "Downloading VAP version $VAP_VERSION"
VAP_EXEC=vap_core_"$VAP_VERSION"_linux64
wget https://bitbucket.org/labjacquespe/vap_core/downloads/"$VAP_EXEC"
mv "$VAP_EXEC" vap
chmod 755 vap
