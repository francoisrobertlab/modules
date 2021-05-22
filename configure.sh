#!/bin/bash

if [ "$1" == "clean" ] ; then
    echo "Removing changes made to .bash_profile"
    if grep -Fq "source .robertlab-apps-addons" ~/.bash_profile ; then
        INDEX=$(grep -n "source .robertlab-apps-addons" ~/.bash_profile | cut -d: -f1)
        sed -i "$((INDEX-1)),$((INDEX+2))d" ~/.bash_profile
    fi
    if [ -f ~/.robertlab-apps-addons ] ; then
        rm ~/.robertlab-apps-addons
    fi
    exit 0
fi

# Remove direct configuration of robert lab modules, if present.
if grep -Fq "ROBERTF_MODULES_DIR=" ~/.bash_profile ; then
    echo "Removing Robert Lab modules from .bash_profile"
    INDEX=$(grep -n "ROBERTF_MODULES_DIR=" ~/.bash_profile | cut -d: -f1)
    sed -i "$((INDEX-1)),$((INDEX+4))d" ~/.bash_profile
fi

# Remove reference to renamed .def-robertf-addons configuration, if present.
if grep -Fq "source .def-robertf-addons" ~/.bash_profile ; then
    echo "Removing file .def-robertf-addons from .bash_profile"
    INDEX=$(grep -n "source .def-robertf-addons" ~/.bash_profile | cut -d: -f1)
    sed -i "$((INDEX-1)),$((INDEX+2))d" ~/.bash_profile
fi

# Source .robertlab-apps-addons file on login.
if ! grep -Fq "source .robertlab-apps-addons" ~/.bash_profile ; then
    echo "Adding Robert Lab Apps addons"
    echo 'if [ -f .robertlab-apps-addons ]; then' >> ~/.bash_profile
    echo '  source .robertlab-apps-addons' >> ~/.bash_profile
    echo 'fi' >> ~/.bash_profile
    echo "" >> ~/.bash_profile
fi

# Create .robertlab-apps-addons file to allow loading of robert modules.
if [ -f ~/.robertlab-apps-addons ] ; then
    rm ~/.robertlab-apps-addons
fi
MODULES_BASE=$(dirname $(readlink -f $0))
echo "## Robert Lab Modules ##" >> ~/.robertlab-apps-addons
echo "MODULES_DIR=$MODULES_BASE" >> ~/.robertlab-apps-addons
echo 'if [ -d "$MODULES_DIR" ]; then' >> ~/.robertlab-apps-addons
echo '  module use $MODULES_DIR' >> ~/.robertlab-apps-addons
echo 'fi' >> ~/.robertlab-apps-addons
echo "" >> ~/.robertlab-apps-addons
