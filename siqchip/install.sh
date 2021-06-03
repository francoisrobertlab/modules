#!/bin/bash

if [ -z "$SIQCHIP" ]
then
  echo "SIQCHIP environment variable must be defined, please load a 'siqchip' module"
  exit 1
fi


# Clone siqchip, if not already cloned.
if [ ! -d "$SIQCHIP" ]
then
  echo "Creating folder $SIQCHIP"
  mkdir -p "$SIQCHIP"
fi
cd "$SIQCHIP" || { echo "Folder $SIQCHIP does not exists"; exit 1; }
if [ ! -d "$SIQCHIP/.git" ]
then
  echo "Cloning siqchip in folder $SIQCHIP"
  git clone https://github.com/BradleyDickson/siQ-ChIP.git .
fi
echo "Checking out version $SIQCHIP_VERSION"
git checkout "v$SIQCHIP_VERSION"
