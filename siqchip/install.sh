#!/bin/bash

if [ -z "$SIQCHIP" ]
then
  echo "SIQCHIP environment variable must be defined, please load a 'siqchip' module"
  exit 1
fi


if [ -d "$SIQCHIP" ]
then
  echo "Deleting old folder $SIQCHIP"
  rm -rf "$SIQCHIP"
fi
echo "Installing siQ-ChIP in folder $SIQCHIP"
mkdir -p "$SIQCHIP"
cd "$SIQCHIP" || { echo "Folder $SIQCHIP does not exists"; exit 1; }
git clone https://github.com/BradleyDickson/siQ-ChIP.git .
echo "Checking out version $SIQCHIP_VERSION"
git checkout "v$SIQCHIP_VERSION"
