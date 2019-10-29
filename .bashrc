# DO NOT MODIFY
#
# Instead make customizations to ~/etc/bashrc.d/900-user.bashrc or
# ~/etc/.bashrc.d/999-host.bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

for bashrc in $(find ${HOME}/etc/bashrc.d/ -name "*.bashrc" -type f); do
  source ${bashrc};
done

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
