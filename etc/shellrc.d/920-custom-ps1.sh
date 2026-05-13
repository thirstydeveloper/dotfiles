if [ -n "$ZSH_VERSION" ]; then
  _p='%{'; _q='%}'
else
  _p=$'\001'; _q=$'\002'
fi

get_PS1() {
  prev_command_status="$?"

  if command -v kubectl 2>&1 >/dev/null && kube_context=$(kubectl config current-context 2>/dev/null); then
    if command -v kubens 2>&1 >/dev/null; then
      kube_ns=$(kubens -c)
      kube_context="${kube_context}@${kube_ns}"
    fi

    PS1="${_p}${C_CYAN_FG}${_q}⎈:${kube_context}${_p}${C_NORMAL_FG}${_q}"
  else
    kube_context=""
    PS1=""
  fi

  current_aws_profile=$(aws configure list | sed 's/^ \+//' | awk -F" {2,}" '$1 == "profile" {print $2}')

  PS1="${PS1} ${_p}${C_LIGHT_BLUE_FG}${_q}🌩 :${current_aws_profile}${_p}${C_NORMAL_FG}${_q}"

  is_in_git_repo=$(git rev-parse --is-inside-work-tree 2>&1)

  if [[ "${is_in_git_repo}" == "true" ]]; then
    repo=$(git config --get remote.origin.url | sed -r 's/.*\/([^\.\/]+)(\.git)?/\1/g')
    repo_root=$(git rev-parse --show-toplevel)
    branch=$(git branch | sed -n '/\* /s///p')

    PS1="${PS1} ${_p}${C_LIGHT_MAGENTA_FG}${_q}ᚴ:${branch}${_p}${C_NORMAL_FG}${_q}"

    PS1="${PS1} ${_p}${C_YELLOW_FG}${_q}${repo}${_p}${C_NORMAL_FG}${_q}"

    if [[ "$(pwd)" != "${repo_root}" ]]; then
      short_relative_path=$(echo "${PWD#${repo_root}/}" | sed "s:\([^/]\)[^/]*/:\1/:g")
      PS1="${PS1}/${_p}${C_LIGHT_GRAY_FG}${_q}${short_relative_path}${_p}${C_NORMAL_FG}${_q}"
    fi

    num_changes=$(git status --porcelain | wc -l)

    if [[ "$num_changes" -eq "0" ]]; then
        PS1="${PS1} ${_p}${C_GREEN_FG}${_q}✔${_p}${C_NORMAL_FG}${_q} "
    else
        PS1="${PS1} ${_p}${C_RED_FG}${_q}✗${_p}${C_NORMAL_FG}${_q} "
    fi
  else
    PS1="${PS1} ${_p}${C_LIGHT_GRAY_FG}${_q}${PWD##*/}${_p}${C_NORMAL_FG}${_q} "
  fi

  PS1="${PS1}${_p}${C_RESET}${_q}"$'\n'

  if [[ "$prev_command_status" -eq "0" ]]; then
    PS1="${PS1}${_p}${C_GREEN_FG}${_q}➜${_p}${C_NORMAL_FG}${_q} "
  else
    PS1="${PS1}${_p}${C_RED_FG}${_q}➜${_p}${C_NORMAL_FG}${_q} "
  fi
}

if [ -n "$ZSH_VERSION" ]; then
  setopt PROMPT_SUBST
  precmd() { get_PS1; }
else
  PROMPT_COMMAND=get_PS1
fi
