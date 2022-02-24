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
    output=$(bash "$module_dir"/install.sh "$version")
    local status=$?
    if [ $status -eq 0 ]
    then
      printf "Installed module %s\n%s\n\n" "$module" "$output"
      true
    else
      printf "Failed installation of module %s\n%s\n\n" "$module" "$output"
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
