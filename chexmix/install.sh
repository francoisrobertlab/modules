#!/bin/bash

if [ -z "$CHEXMIX" ]
then
  echo "CHEXMIX environment variable must be defined, please load a 'chexmix' module"
  exit 1
fi


if [ -d "$CHEXMIX" ]
then
  echo "Deleting old folder $CHEXMIX"
  rm -rf "$CHEXMIX"
fi
echo "Installing ChExMix in folder $CHEXMIX"
mkdir -p "$CHEXMIX"
cd "$CHEXMIX" || { echo "Folder $CHEXMIX does not exists"; exit 1; }
wget http://lugh.bmb.psu.edu/software/chexmix/chexmix_v"$CHEXMIX_VERSION".jar
