#!/bin/bash

if [ -z "$CHEXMIX" ]
then
  echo "CHEXMIX environment variable must be defined, please load a 'chexmix' module"
  exit 1
fi


# Download ChExMix.
if [ ! -d "$CHEXMIX" ]
then
  echo "Creating folder $CHEXMIX"
  mkdir -p "$CHEXMIX"
fi
cd "$CHEXMIX" || { echo "Folder $CHEXMIX does not exists"; exit 1; }
echo "Downloading ChExMix version $CHEXMIX_VERSION"
wget http://lugh.bmb.psu.edu/software/chexmix/chexmix_v"$CHEXMIX_VERSION".jar
