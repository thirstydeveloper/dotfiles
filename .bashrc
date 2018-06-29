# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f ${HOME}/etc/host.bashrc ]; then
  . ${HOME}/etc/host.bashrc
fi

set -o vi

pathmunge() {
  if ! echo $PATH | /bin/egrep -q "(^|:)$1($|:)"; then
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
