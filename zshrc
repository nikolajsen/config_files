fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit

# automatically enter directories without cd
setopt auto_cd

# use vim as an editor
export EDITOR=vim

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# vi mode
bindkey -v
bindkey ^F vi-cmd-mode

# use incremental search
bindkey ^R history-incremental-search-backward

# expand functions in the prompt
setopt prompt_subst

# prompt
export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '

# ignore duplicate history entries
setopt histignoredups

# keep more history
export HISTSIZE=10000
export HISTFILE="$HOME/.history"
setopt hist_ignore_all_dups
setopt hist_ignore_space
# save history as well
export SAVEHIST=10000

# look for ey config in project dirs
export EYRC=./.eyrc

# restore previous cwd
if [[ -f ~/.last_cwd ]]; then
  cd "`cat ~/.last_cwd`"
fi
_save_last_cwd() {
  echo `pwd` > ~/.last_cwd
}
chpwd_functions=( "${chpwd_functions[@]}" _save_last_cwd )

# include the contents from .profile
source "$HOME/.profile"


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
