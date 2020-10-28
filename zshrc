[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

setopt SHARE_HISTORY
setopt extended_glob

autoload -Uz compinit
compinit

HISTFILE=~/.zhistory
SAVEHIST=10000
HISTSIZE=$SAVEHIST

PROMPT="%F{cyan}%n@%m%f %F{yellow}%1~%f%F{green} $ %f"

export PATH=$HOME/bin:$HOME/.cargo/bin:$PATH
export EDITOR=vim
export QT_QPA_PLATFORM=wayland

export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden"
export FZF_DEFAULT_OPTS="--preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300' --preview-window='right:hidden:wrap' --bind='f2:toggle-preview'"

export SSH_AUTH_SOCK=/Users/haiko/.gnupg/S.gpg-agent.ssh

bindkey -e
source $HOME/dotfiles/vendor/fzf/completion.zsh
source $HOME/dotfiles/vendor/fzf/key-bindings.zsh

source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

[[ -f $HOME/.creds.zsh ]] && source $HOME/.creds.zsh

