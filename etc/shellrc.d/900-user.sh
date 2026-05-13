pathmunge() {
  if ! echo $PATH | egrep -q "(^|:)$1($|:)"; then
    if [ "$2" = "after" ]; then
      PATH=$PATH:$1
    else
      PATH=$1:$PATH
    fi
  fi
}

pathmunge ${HOME}/.local/bin
pathmunge ${HOME}/bin

export PATH
export EDITOR=vim
export LANG=en_US.UTF-8

set -o vi

if [ -n "$ZSH_VERSION" ]; then
  alias reload='source ${HOME}/.zshrc'
else
  alias reload='source ${HOME}/.bashrc'
fi

alias cddot='cd ${HOME}/dotfiles'
