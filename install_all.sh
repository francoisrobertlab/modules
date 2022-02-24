#!/bin/bash
#SBATCH --account=def-robertf
#SBATCH --time=24:00:00
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH --mail-type=NONE
#SBATCH --output=install_all-%A.out
#SBATCH --error=install_all-%A.out

install_module () {
  local module=$1
  local module_dir=$(dirname "$module".lua)
  local version=$(basename "$module")
  if [ -f "$module_dir"/install.sh ]
  then
    local output
    output=$(bash "$module_dir"/install.sh "$version" 2>&1)
    local status=$?
    if [ $status -eq 0 ]
    then
      printf "Installed module %s\n%s\n\n\n\n" "$module" "$output"
      true
    else
      printf "Failed installation of module %s\n%s\n\n\n\n" "$module" "$output"
      false
    fi
  fi
}
export -f install_module

modules=$(find . -type f -name "*.lua" \( ! -iname ".*" \) | awk '{print substr($0, 3, length($0)-6)}')
threads=1
if [ -n "$SLURM_CPUS_PER_TASK" ]
then
  threads="$SLURM_CPUS_PER_TASK"
fi
parallel -P "$threads" --env install_module install_module ::: "$modules"

printf "\n\nRun the following commands to install plot2DO libraries for version 1.0-87fadb4-pre2021 (replace \$project and \$email):\n"
printf "module purge && module load StdEnv/2018.3 plot2do/1.0-87fadb4-pre2021\n"
printf "cd \$PLOT2DO\n"
printf "sbatch --account=\$project --mail-user=\$email --mail-type=ALL plot2do_setup.sh\n\n"
