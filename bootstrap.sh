#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function install() {
  setupHomeDirectory
  installDotFiles
  updateVim
}

setupHomeDirectory() {
  mkdir -p ${HOME}/{bin,code,etc,notes,tmp}
  mkdir -p ${HOME}/etc/shellrc.d

  if [ ! -f ${HOME}/etc/shellrc.d/999-host.sh ]; then
    echo "# Host-specific shell settings here" >> ${HOME}/etc/shellrc.d/999-host.sh
  fi

  if [ ! -f ${HOME}/.ssh/id_rsa ]; then
    ssh-keygen -b 2048 -t rsa -f ${HOME}/.ssh/id_rsa -q -N ""
    echo "New ssh key created at ${HOME}/.ssh/id_rsa"
    echo "Be sure to register it with whatever services are needed"
    echo
  fi
}

function installDotFiles() {
  rsync --exclude ".git/" \
        --exclude ".gitmodules" \
        --exclude "bootstrap.sh" \
        --exclude "README.md" \
        --exclude "CHANGELOG.md" \
        --exclude "etc" \
        --exclude ".vim" \
        --exclude ".pre-commit-config.yaml" \
        -avh --no-perms . ~;

  # These are copied separately to maintain them as symlinks
  rsync -avh --no-perms etc/* ~/etc/
  rsync -avh --no-perms .vim/* ~/.vim/

  echo "Dotfiles installed. Open a new terminal (or run 'source ~/.zprofile') to apply changes."
}

function updateVim() {
	vim +PluginInstall +qall
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  install
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    install
  fi
fi;

unset install;
