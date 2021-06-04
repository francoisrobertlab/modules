#!/bin/bash

if [ "$1" == "clean" ] ; then
    echo "Removing changes made to .bash_profile"
    if grep -Fq "export JOB_MAIL=" ~/.bash_profile ; then
        INDEX=$(grep -n "JOB_MAIL=" ~/.bash_profile | cut -d: -f1)
        sed -i "$((INDEX)),$((INDEX+1))d" ~/.bash_profile
    fi
    if grep -Fq "alias sbatch=" ~/.bash_profile ; then
        INDEX=$(grep -n "alias sbatch=" ~/.bash_profile | cut -d: -f1)
        sed -i "$((INDEX)),$((INDEX+1))d" ~/.bash_profile
    fi
    exit 0
fi

EMAIL=$1
if [[ ! "$EMAIL" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$ ]] ; then
    echo "You must supply your email address as the first argument"
    exit 1
fi

# Set user's email.
if grep -Fq "export JOB_MAIL=" ~/.bash_profile ; then
    echo "Replacing email address environment variables present in .bash_profile"
    sed -i -E "s/export JOB_MAIL=.+/export JOB_MAIL=$EMAIL/" ~/.bash_profile
else
    echo "Adding email address to environment variables in .bash_profile"
    echo "export JOB_MAIL=$EMAIL" >> ~/.bash_profile
    echo "" >> ~/.bash_profile
fi

# Make sbatch send mail to user by default.
if grep -Fq "alias sbatch=" ~/.bash_profile ; then
    sed -i -E "s/alias sbatch=.+/alias sbatch='sbatch --mail-type=NONE --mail-user=\$JOB_MAIL'/" ~/.bash_profile
else
    echo "Adding email notification for sbatch"
    echo "alias sbatch='sbatch --mail-type=NONE --mail-user=\$JOB_MAIL'" >> ~/.bash_profile
    echo "" >> ~/.bash_profile
fi
