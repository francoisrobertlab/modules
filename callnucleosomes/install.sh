#!/bin/bash

if [ -z "$CALLNUCLEOSOMES" ]
then
  echo "CALLNUCLEOSOMES environment variable must be defined, please load a 'callnucleosomes' module"
  exit 1
fi


# Download CallNucleosomes.
if [ -d "$CALLNUCLEOSOMES" ]
then
  echo "Deleting folder $CALLNUCLEOSOMES"
  rm -rf "$CALLNUCLEOSOMES"
fi
echo "Creating folder $CALLNUCLEOSOMES"
mkdir -p "$CALLNUCLEOSOMES"
cd "$CALLNUCLEOSOMES" || { echo "Folder $CALLNUCLEOSOMES does not exists"; exit 1; }
if [ "$CALLNUCLEOSOMES_VERSION" == "0.1-e5b433d" ]
then
  echo "Cloning CallNucleosomes from francoisrobertlab in folder $CALLNUCLEOSOMES"
  git clone https://github.com/francoisrobertlab/CallNucleosomes.git .
  echo "Checking out version $CALLNUCLEOSOMES_VERSION"
  git checkout e5b433d839eec8483348baedbc6a470215965e6f
else
  echo "Cloning CallNucleosomes in folder $CALLNUCLEOSOMES"
  git clone https://github.com/srinivasramachandran/CallNucleosomes.git .
  echo "Checking out version $CALLNUCLEOSOMES_VERSION"
  git checkout "$CALLNUCLEOSOMES_VERSION"
fi
