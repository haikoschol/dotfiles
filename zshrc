[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

setopt SHARE_HISTORY
setopt extended_glob

autoload -Uz compinit
compinit

HISTFILE=~/.zhistory
SAVEHIST=10000
HISTSIZE=$SAVEHIST

PROMPT="%F{cyan}%n@%m%f %F{yellow}%1~%f%F{green} $ %f"

export PATH=$HOME/bin:$PATH
export EDITOR="emacs -nw -q"

export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden"
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

alias pacs='pacman -Ss | fzf'
alias em='emacs -nw -q'