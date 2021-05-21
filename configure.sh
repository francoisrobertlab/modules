#!/bin/bash

if [ "$1" == "clean" ] ; then
    echo "Removing changes made to .bash_profile"
    if ! grep -Fq "source .def-robertf-addons" ~/.bash_profile ; then
        INDEX=$(grep -n "source .def-robertf-addons" ~/.bash_profile | cut -d: -f1)
        sed -i "$((INDEX-1)),$((INDEX+2))d" ~/.bash_profile
    fi
    if [ -f ~/.def-robertf-addons ] ; then
        rm ~/.def-robertf-addons
    fi
    exit 0
fi

# Remove direct configuration of robert lab modules, if present.
if grep -Fq "ROBERTF_MODULES_DIR=" ~/.bash_profile ; then
    echo "Removing Robert Lab modules from .bash_profile"
    INDEX=$(grep -n "ROBERTF_MODULES_DIR=" ~/.bash_profile | cut -d: -f1)
    sed -i "$((INDEX-1)),$((INDEX+4))d" ~/.bash_profile
fi

# Source .def-robertf-addons file on login.
if ! grep -Fq "source .def-robertf-addons" ~/.bash_profile ; then
    echo "Adding Robert Lab addons"
    echo 'if [ -f .def-robertf-addons ]; then' >> ~/.bash_profile
    echo '  source .def-robertf-addons' >> ~/.bash_profile
    echo 'fi' >> ~/.bash_profile
    echo "" >> ~/.bash_profile
fi

# Create .def-robertf-addons file to alow loading of robert modules.
if [ -f ~/.def-robertf-addons ] ; then
    rm ~/.def-robertf-addons
fi
echo "## Robert Lab Modules ##" >> ~/.def-robertf-addons
echo "MODULES_DIR=~/projects/def-robertf/modules" >> ~/.def-robertf-addons
echo 'if [ -d "$MODULES_DIR" ]; then' >> ~/.def-robertf-addons
echo '  module use $MODULES_DIR' >> ~/.def-robertf-addons
echo 'fi' >> ~/.def-robertf-addons
echo "" >> ~/.def-robertf-addons
