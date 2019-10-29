get_PS1() {
  prev_command_status="$?"

  if command -v kubectl 2>&1 >/dev/null; then
    kube_context=$(kubectl config current-context)
    if command -v kubens 2>&1 >/dev/null; then
      kube_ns=$(kubens -c)
      kube_context="${kube_context}@${kube_ns}"
    fi

    PS1="\[${C_CYAN_FG}\]⎈:${kube_context}\[${C_NORMAL_FG}\]"
  else
    PS1=""
  fi

  current_aws_profile=$(aws configure list | sed 's/^ \+//' | awk -F" {2,}" '$1 == "profile" {print $2}')

  PS1="${PS1} \[${C_LIGHT_BLUE_FG}\]🌩 :${current_aws_profile}\[${C_NORMAL_FG}\]"

  is_in_git_repo=$(git rev-parse --is-inside-work-tree 2>&1)

  if [[ "${is_in_git_repo}" == "true" ]]; then
    repo=$(git config --get remote.origin.url | sed -r 's/[^\/]+\/(.*)\.git/\1/g')
    repo_root=$(git rev-parse --show-toplevel)
    branch=$(git branch | sed -n '/\* /s///p')

    PS1="${PS1} \[${C_LIGHT_MAGENTA_FG}\]ᚴ:${branch}\[${C_NORMAL_FG}\]"

    PS1="${PS1} \[${C_YELLOW_FG}\]${repo}\[${C_NORMAL_FG}\]"

    if [[ "$(pwd)" != "${repo_root}" ]]; then
      short_relative_path=$(realpath --relative-to=$(git rev-parse --show-toplevel) $(pwd) | sed "s:\([^/]\)[^/]*/:\1/:g")
      PS1="${PS1}/\[${C_LIGHT_GRAY_FG}\]${short_relative_path}\[${C_NORMAL_FG}\]"
    fi

    num_changes=$(git status --porcelain | wc -l)

    if [[ "$num_changes" -eq "0" ]]; then
        PS1="${PS1} \[${C_GREEN_FG}\]✔\[${C_NORMAL_FG}\] "
    else
        PS1="${PS1} \[${C_RED_FG}\]✗\[${C_NORMAL_FG}\] "
    fi
  else
    PS1="${PS1} \[${C_LIGHT_GRAY_FG}\]\W\[${C_NORMAL_FG}\] "
  fi

  PS1="${PS1}\[${C_RESET}\]\n"

  if [[ "$prev_command_status" -eq "0" ]]; then
    PS1="${PS1}\[${C_GREEN_FG}\]➜\[${C_NORMAL_FG}\] "
  else
    PS1="${PS1}\[${C_RED_FG}\]➜\[${C_NORMAL_FG}\] "
  fi
}

PROMPT_COMMAND=get_PS1
