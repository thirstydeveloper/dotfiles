# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

* EDITOR and LANG to 900-user.bashrc
* reload alias to 900-user.bashrc
* .tmux.conf
* multiple vim plugins
* add bash colors to bashrc.d
* git aliases

### Changed
* Many changes to .gitconfig
* Bootstrap preserves symlinks for etc and .vim
* bootstrap excludes CHANGELOG
* PS1 to include:
    * kube-context
    * aws profile
    * icon for whether git workspace is clean or not
    * icon for whether last command was successful
    * move command entry to new line

### Fixed

* Fix fzf in .bashrc

### [1.0.0] - 2019-03-12

Initial release
