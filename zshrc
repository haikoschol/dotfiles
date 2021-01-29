[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

setopt SHARE_HISTORY
setopt extended_glob

autoload -Uz compinit
compinit

HISTFILE=~/.zhistory
SAVEHIST=10000
HISTSIZE=$SAVEHIST

PROMPT="%F{yellow}%1~%f%F{green}$ %f"
KUBE_PS1_SYMBOL_ENABLE=false
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
PS1='$(kube_ps1)'$PS1

export PATH=$HOME/bin:$HOME/go/bin:$HOME/.cargo/bin:$PATH
export EDITOR=vim
export QT_QPA_PLATFORM=wayland

export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden"
export FZF_DEFAULT_OPTS="--preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300' --preview-window='right:hidden:wrap' --bind='f2:toggle-preview'"

export SSH_AUTH_SOCK=/Users/haiko/.gnupg/S.gpg-agent.ssh

export CLOUDSDK_PYTHON=/usr/local/opt/python@3/bin/python3

bindkey -e
source $HOME/dotfiles/vendor/fzf/completion.zsh
source $HOME/dotfiles/vendor/fzf/key-bindings.zsh

[[ -f $HOME/.creds.zsh ]] && source $HOME/.creds.zsh

alias sha256sum='shasum -a 256'
