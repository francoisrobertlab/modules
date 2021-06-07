#!/bin/bash

if [ -z "$GEM" ]
then
  echo "GEM environment variable must be defined, please load a 'gem' module"
  exit 1
fi


if [ -d "$GEM" ]
then
  echo "Deleting old folder $GEM"
  rm -rf "$GEM"
fi
echo "Installing GEM in folder $GEM"
mkdir -p "$GEM"
cd "$GEM" || { echo "Folder $GEM does not exists"; exit 1; }
GEM_TAR=gem.v"$GEM_VERSION".tar.gz
wget https://groups.csail.mit.edu/cgs/gem/download/"$GEM_TAR"
tar -xf "$GEM_TAR"
rm "$GEM_TAR"
mv gem/* .
rmdir gem
