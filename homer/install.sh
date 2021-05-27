#!/bin/bash

if [ -z "$HOMER" ]
then
  echo "HOMER environment variable must be defined, please load a homer module"
  exit 1
fi


# Download Homer, if not already downloaded.
if [ ! -d "$HOMER" ]
then
  echo "Creating folder $HOMER"
  mkdir -p "$HOMER"
fi
cd "$HOMER" || { echo "Folder $HOMER does not exists"; exit 1; }
wget http://homer.ucsd.edu/homer/configureHomer.pl
perl configureHomer.pl -install -version "v$HOMER_VERSION"
