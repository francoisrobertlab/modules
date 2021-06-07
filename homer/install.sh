#!/bin/bash

if [ -z "$HOMER" ]
then
  echo "HOMER environment variable must be defined, please load a 'homer' module"
  exit 1
fi


if [ -d "$HOMER" ]
then
  echo "Deleting old folder $HOMER"
  rm -rf "$HOMER"
fi
echo "Installing ChIPexoQual in folder $HOMER"
mkdir -p "$HOMER"
cd "$HOMER" || { echo "Folder $HOMER does not exists"; exit 1; }
wget http://homer.ucsd.edu/homer/configureHomer.pl
perl configureHomer.pl -install -version "v$HOMER_VERSION"
