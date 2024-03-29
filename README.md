## Install

```bash
git clone git@github.com:jacobmoe/dotfiles.git

# git

brew install git
brew install git-completion

# emacs

# brew install --cask emacs
brew install emacs-plus --with-native-comp
brew tap homebrew/cask-fonts
brew install --cask font-source-code-pro
brew install fd
brew install ispell

# go

GO111MODULE=on go get -v golang.org/x/tools/gopls@latest

# ruby

brew install chruby
brew install ruby-install
ruby-install

# node

brew install node
npm install -g tern


# ledger

brew install ledger

# link

ln -s $HOME/dotfiles/doom.d $HOME/.doom.d
ln -s $HOME/dotfiles/zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/bash_profile $HOME/.bash_profile
ln -s $HOME/dotfiles/bashrc $HOME/.bashrc
ln -s $HOME/dotfiles/atom $HOME/.atom
ln -s $HOME/dotfiles/gitconfig $HOME/.gitconfig
ln -s $HOME/dotfiles/eslintrc $HOME/.eslintrc
ln -s $HOME/dotfiles/gitignore_global $HOME/.gitignore_global
ln -s $HOME/dotfiles/ledgerrc $HOME/.ledgerrc

# 1password

# https://developer.1password.com/docs/cli/get-started/#install
brew install --cask 1password/tap/1password-cli
```
