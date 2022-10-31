# if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
#    alias vim=/Applications/MacVim.app/Contents/MacOS/Vim
# fi

# Set Bash Completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

PATH=~/bin:$PATH

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

_activate_kubecomplete() {
  #kubectl completion bash > ~/kube_completion.sh
  source ~/kube_completion.sh 
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

_activate_java {
  export JAVA_HOME=$(/usr/libexec/java_home -v 11.0.8)
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


# Setup java related things
_activate_java_dev() {
  #export JPDA_ADDRESS=8000
  #export JPDA_TRANSPORT=dt_socket
  #export JPDA_OPTS="-agentlib:jdwp=transport=dt_socket,address=8000,server=y,suspend=n"
  #export GRADLE_HOME=/usr/local/Cellar/gradle/2.4
  export GROOVY_HOME=/usr/local/opt/groovy/libexec
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

_activate_kubecomplete 
_activate_pyenv
#_activate_chruby

#complete -C '/usr/local/bin/aws_completer' aws
