# DO NOT MODIFY
#
# Instead make customizations to ~/etc/bashrc.d/900-user.bashrc or
# ~/etc/.bashrc.d/999-host.bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

for shellrc in $(find ${HOME}/etc/shellrc.d/ -name "*.sh" -type f | sort); do
  source ${shellrc}
done

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
