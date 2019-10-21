#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade "$(brew list)"

# Make sure that we have Casks
brew install cask

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 5.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! grep -Fq '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Text editor (nvim)
brew install neovim
ln -fs /Users/c/dotfiles/init.vim /Users/c/.config/nvim/init.vim


# 🐍
brew install python
brew install jupyter
brew install csvkit
brew install pipenv
brew install pyenv

# Statistical Softwares
brew install openblas
brew install r

# Install other useful binaries.
brew install bfg
brew install dark-mode
brew install git
brew install git-lfs
brew install gnupg
brew install htop
brew install jq
brew install miller
brew install ripgrep
brew install rustup-init
brew install shellcheck
brew install speedtest_cli
brew install thefuck
brew install tldr
brew install tmux
brew install tree
brew install xz

# Remove outdated versions from the cellar.
brew cleanup -s
# To conserve space; removes ALL package files
brew cleanup --prune 0
