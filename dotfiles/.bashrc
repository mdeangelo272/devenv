# if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
#    alias vim=/Applications/MacVim.app/Contents/MacOS/Vim
# fi

# Set Bash Completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi


# Set my terminal prompt
PS1="\[\033[036m\][\!] \W $ \[\033[037m\]"
#PS1="\[\033[036m\]\w $ \[\033[037m\]"

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

_activate_private() {
  source ~/.priv/private.sh
}

# Setup pyenv and other python related things
_activate_pyenv() {
  eval "$(pyenv init -)"
  #eval "$(pyenv virtualenv-init -)"
}
_jup_up() {
	pyenv shell 3.5.2
	#pyenv activate jup
  cd /Users/mdeangelo272/dev/repos/mdeangelo272/jupyter
	jupyter notebook &
}

# Setup rbenv and other ruby or chef things
_activate_rbenv() {
  PATH=~/.rbenv/shims:$PATH:~/bin
  export NVM_DIR=~/.nvm
  source $(brew --prefix nvm)/nvm.sh
  eval "$(rbenv init -)"
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


# Setup java related things
_activate_java_dev() {
  export JPDA_ADDRESS=8000
  export JPDA_TRANSPORT=dt_socket
  export JPDA_OPTS="-agentlib:jdwp=transport=dt_socket,address=8000,server=y,suspend=n"
  export GRADLE_HOME=/usr/local/Cellar/gradle/2.4
}

# GPG
#export GPG_TTY=$(tty)

# Activation
_activate_pyenv
_activate_private
