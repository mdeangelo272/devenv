# Configuration Files

This repository represents my common configurations. These include
* .vimrc
* .ctags
* .gitconfig

Installing tmux package manager

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Install the tmux plugins using `<prefix> I`

Installing oh-my-zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

Create Symbolic links to the configuration files, e.g.
```
DEVENV_REPO_PATH=~/repos/mdeangelo272/devenv
# mv ~/.zshrc ~/.zshrc-bak
ln -s $DEVENV_REPO_PATH/dotfiles/.zshrc ~/.zshrc
```


