# DO NOT MODIFY
#
# Instead make customizations to ~/etc/shellrc.d/900-user.sh or
# ~/etc/shellrc.d/999-host.sh

# Source global definitions
if [ -f /etc/zshrc ]; then
  . /etc/zshrc
fi

for shellrc in $(find ${HOME}/etc/shellrc.d/ -name "*.sh" -type f | sort); do
  source ${shellrc}
done

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
