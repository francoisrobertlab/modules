#!/bin/bash

if [ -z "$PLOT2DO" ]
then
  echo "PLOT2DO environment variable must be defined, please load a 'plot2do' module"
  exit 1
fi


# Clone plot2do, if not already cloned.
if [ ! -d "$PLOT2DO" ]
then
  echo "Creating folder $PLOT2DO"
  mkdir -p "$PLOT2DO"
fi
cd "$PLOT2DO" || { echo "Folder $PLOT2DO does not exists"; exit 1; }
if [ ! -d "$PLOT2DO/.git" ]
then
  echo "Cloning plot2do in folder $PLOT2DO"
  git clone https://github.com/rchereji/plot2DO.git .
fi
echo "Checking out version $PLOT2DO_VERSION"
if [ "$PLOT2DO_VERSION" == "1.0-87fadb4" ]
then
  git checkout 87fadb4acd23214f83e5440b0ccb02c623fa62d9
else
  git checkout "$PLOT2DO_VERSION"
fi
cp "$PLOT2DO_MODULE"/plot2DO_export_matrix.R "$PLOT2DO"
cp "$PLOT2DO_MODULE"/plot2do_setup.sh "$PLOT2DO"

echo ""
echo ""
echo "Run the following commands to install plot2DO libraries:"
echo "    Replace \$project with the name of your project"
echo "    Replace \$email with your email address"
echo ""
echo "cd $PLOT2DO"
echo "sbatch --account=\$project --mail-user=\$email --mail-type=ALL plot2do_setup.sh"
