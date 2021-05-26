#!/bin/bash

if [ -z "$ROBTOOLS" ]
then
  echo "ROBTOOLS environment variable must be defined, please load a robtools module"
  exit 1
fi


PROJECT=$1
if [ -z "$PROJECT" ] ; then
    echo "You must supply the project name as the first argument"
    exit 1
fi
if [ ! -d "$HOME/projects/$PROJECT" ] ; then
    echo "Project $PROJECT not present in your projects folder"
    exit 1
fi


cd "$ROBTOOLS"
find bash -maxdepth 1 -type f -exec git checkout -- {} \;
find bash -maxdepth 1 -type f -exec sed -i "s/def-robertf/$PROJECT/g" {} \;
