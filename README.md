## Install

```bash
cd ~ && git clone git@github.com:jacobmoe/dotfiles.git

# git

brew install git
brew install git-completion

# node

brew install node

# emacs

brew install emacs --HEAD --use-git-head --with-cocoa --srgb
ln -s /usr/local/Cellar/emacs/HEAD/Emacs.app /Applications
brew install ag
brew install ispell
npm install -g eslint
git clone https://github.com/syl20bnr/spacemacs $HOME/.emacs.d
rm $HOME/.spacemacs

# ruby

brew install chruby
brew install ruby-install
ruby-install

# ledger

brew install ledger

# link

ln -s $HOME/dotfiles/spacemacs.d $HOME/.spacemacs.d
ln -s $HOME/dotfiles/bash_profile $HOME/.bash_profile
ln -s $HOME/dotfiles/bashrc $HOME/.bashrc
ln -s $HOME/dotfiles/atom $HOME/.atom
ln -s $HOME/dotfiles/gitconfig $HOME/.gitconfig
ln -s $HOME/dotfiles/eslintrc $HOME/.eslintrc
ln -s $HOME/dotfiles/gitignore_global $HOME/.gitignore_global
ln -s $HOME/dotfiles/ledgerrc $HOME/.ledgerrc
```
