#!/bin/bash

if [ "$1" == "clean" ]
then
  echo "Removing changes made to .bash_profile"
  if grep -Fq "source .robertlab-apps-addons" ~/.bash_profile
  then
      INDEX=$(grep -n "source .robertlab-apps-addons" ~/.bash_profile | cut -d: -f1)
      sed -i "$((INDEX-1)),$((INDEX+2))d" ~/.bash_profile
  fi
  if [ -f ~/.robertlab-apps-addons ]
  then
      rm ~/.robertlab-apps-addons
  fi
  exit 0
fi

# Remove direct configuration of robert lab modules, if present.
if grep -Fq "ROBERTF_MODULES_DIR=" ~/.bash_profile
then
  echo "Removing Robert Lab modules from .bash_profile"
  INDEX=$(grep -n "ROBERTF_MODULES_DIR=" ~/.bash_profile | cut -d: -f1)
  sed -i "$((INDEX-1)),$((INDEX+4))d" ~/.bash_profile
fi

# Remove reference to renamed .def-robertf-addons configuration, if present.
if grep -Fq "source .def-robertf-addons" ~/.bash_profile
then
  echo "Removing file .def-robertf-addons from .bash_profile"
  INDEX=$(grep -n "source .def-robertf-addons" ~/.bash_profile | cut -d: -f1)
  sed -i "$((INDEX-1)),$((INDEX+2))d" ~/.bash_profile
fi

# Source .robertlab-apps-addons file on login.
if ! grep -Fq "source .robertlab-apps-addons" ~/.bash_profile
then
  echo "Adding Robert Lab Apps addons"
  {
    echo 'if [ -f .robertlab-apps-addons ]; then'
    echo '  source .robertlab-apps-addons'
    echo 'fi'
    echo ""
  }  >> ~/.bash_profile
fi

# Create .robertlab-apps-addons file to allow loading of robert modules.
if [ -f ~/.robertlab-apps-addons ]
then
  rm ~/.robertlab-apps-addons
fi
MODULES_BASE=$(dirname $(readlink -f $0))
{
  echo "## Add Robert Lab Modules scripts to PATH ##"
  echo "PATH=$MODULES_BASE:\$PATH"
  echo "export PATH"
  echo ""
  echo "## Robert Lab Modules ##"
  echo "MODULES_DIR=$MODULES_BASE"
  echo 'if [ -d "$MODULES_DIR" ]; then'
  echo '  module use $MODULES_DIR'
  echo 'fi'
  echo ""
} >> ~/.robertlab-apps-addons
