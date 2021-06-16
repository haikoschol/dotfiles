[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

setopt SHARE_HISTORY
setopt extended_glob

fpath=(~/dotfiles/zsh/completions $fpath)
autoload -Uz compinit
compinit -u

HISTFILE=~/.zhistory
SAVEHIST=10000
HISTSIZE=$SAVEHIST

PROMPT="%F{yellow}%1~%f%F{green}$ %f"

export PATH=$HOME/bin:$HOME/go/bin:$HOME/.cargo/bin:/opt/homebrew/sbin:/opt/homebrew/bin:$PATH
export EDITOR=vim

export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden"
export FZF_DEFAULT_OPTS="--preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300' --preview-window='right:hidden:wrap' --bind='f2:toggle-preview'"

export SSH_AUTH_SOCK=/Users/haiko/.gnupg/S.gpg-agent.ssh

bindkey -e
source $HOME/dotfiles/vendor/fzf/completion.zsh
source $HOME/dotfiles/vendor/fzf/key-bindings.zsh
source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc

[[ -f $HOME/.creds.zsh ]] && source $HOME/.creds.zsh

if [[ "$TERMINAL_EMULATOR" == "JetBrains-JediTerm" ]]; then
  bindkey "∫" backward-word # Option-b
  bindkey "ƒ" forward-word  # Option-f
  bindkey "∂" delete-word   # Option-d
fi

alias oni='/Applications/Onivim2.app/Contents/MacOS/Oni2'
alias ll='ls -lah'
