# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/mdeangelo272/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

# MKD configurations

# Set Brew Completion
#if [ -f $(brew --prefix)/etc/bash_completion ]; then
#  . $(brew --prefix)/etc/bash_completion
#fi

PATH=~/bin:$PATH

# git helpers
_git_multi() {
  path=.
  command=$1
  find $path -type d -name .git \
    | xargs -n 1 dirname \
    | sort \
    | while read line; do echo $line && pushd > /dev/null $line && git $command && popd > /dev/null; done
}
_git_last_touched() {
  "git ls-tree -r --name-only HEAD | while read filename; do   echo \"$(git log -1 --format="%ai %ae" -- $filename) $filename\"; done | sort -r | less"
}

_activate_kubecomplete() {
  #kubectl completion bash > ~/kube_completion.sh
  #source ~/kube_completion.sh 
}

# Setup pyenv and other python related things
_activate_pyenv() {
  eval "$(pyenv init -)"
  #eval "$(pyenv virtualenv-init -)"
}

# Setup chruby and other ruby or chef things
_activate_chruby() {
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh
  #chruby ruby-2.6.3
}

_activate_chef() {
  eval "$(chef shell-init bash)"
}

_set_kube_context(){
  local context=$1
  PS1_ORIG=${PS1_ORIG:-$PS1}
  alias kubectl="kubectl --context $context"
  PS1="($context) $PS1_ORIG"
}

_public_ip() {
  $(curl ipinfo.io/ip 2> /dev/null)
}


_aws_whoami() {
  #echo "Profile: $AWS_PROFILE"
  #echo "Region: $AWS_REGION"
  aws configure list | egrep '(profile|region)'
  aws sts get-caller-identity
}

_all() {
  dirs=$(ls)

  for dir in $dirs; do
    #export $dir
    pushd $dir >> /dev/null
    echo `pwd`
    echo '------'
    $@
    popd >> /dev/null
    echo
    #unset dir
  done
}

# GPG
#export GPG_TTY=$(tty)

# Activation

_activate_pyenv
#_activate_kubecomplete 
#_activate_chruby


#complete -C /usr/local/Cellar/terraform/0.11.13/bin/terraform terraform
#complete -C /usr/local/bin/terraform terraform
#complete -C '/usr/local/bin/aws_completer' aws

if [[ $(pwd) == '/' ]]; then
  cd ~
fi
