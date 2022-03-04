#!/bin/bash

validate_module_version () {
  local version=$1
  local name=$2
  if [ -z "$version" ] && [ ! -f .modulerc.lua ]
  then
    echo "Version of $name module to install is required"
    exit 1
  fi
  if [ -n "$version" ] && [ ! -f "$version".lua ]
  then
    echo "Version $version of $name module does not exists"
    exit 1
  fi
}

clean_module_dir () {
  local dir=$1
  if [ -d "$dir" ]
  then
    echo "Deleting folder $dir"
    rm -rf "$dir"
  fi
  mkdir -p "$dir"
}

get_project_name () {
  local account="def-robertf" # Defaults to def-robertf
  if [ -d "$HOME"/projects ]
  then
    script=$(dirname $(readlink -f "$PWD"))
    for project in "$HOME"/projects/*
    do
      project_path=$(readlink -f "$project")
      if [[ $script == $project_path/* ]]
      then
        account=$(basename "$project")
      fi
    done
  fi
  echo "$account"
}

fix_python_shebang () {
  local dir=$1
  local wrapper=$2
  find "$dir" -type f -executable -not -name "$wrapper" -exec sed -i "1 s|^#\!.*$|#!/usr/bin/env $wrapper|g" {} \;
}

write_python_shebang_wrapper () {
  local wrapper=$1
  local python=$2
  if [ -f "$wrapper" ]
  then
    rm "$wrapper"
  fi
  {
    echo "#!/bin/bash"
    echo "python=$python"
    echo "exec \"\$python\" \"\$@\""
  } >> "$wrapper"
  chmod 755 "$wrapper"
}
