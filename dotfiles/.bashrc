if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
   alias vim=/Applications/MacVim.app/Contents/MacOS/Vim
 fi

#alias git-last-touched="git ls-tree -r --name-only HEAD | while read filename; do   echo \"$(git log -1 --format="%ai %ae" -- $filename) $filename\"; done | sort -r | less"

export JPDA_ADDRESS=8000
export JPDA_TRANSPORT=dt_socket
export JPDA_OPTS="-agentlib:jdwp=transport=dt_socket,address=8000,server=y,suspend=n"
export GRADLE_HOME=/usr/local/Cellar/gradle/2.4

# Setup rbenv
#PATH=~/.rbenv/shims:$PATH:~/bin

# export NVM_DIR=~/.nvm
# source $(brew --prefix nvm)/nvm.sh
#eval "$(rbenv init -)"

# Setup yyenv

eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

git-global-pull() {
  find ~/dev/repos/calance/ -type d -name .git \
      | xargs -n 1 dirname \
        | sort \
          | while read line; do echo $line && cd $line && git pull; done
}


#source ~/.priv/private.sh

jup-up() {
	pyenv shell 3.5.2
	pyenv activate jup
	jupyter notebook &
}
