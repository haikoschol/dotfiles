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

function gsw() {
    SEARCH=${@:-''};
    if [ $SEARCH ]; then
        git branch --format "%(refname:short)" | fzf -i -1 --preview 'git log --oneline {}' --query "$SEARCH" | xargs git switch
    else
        git branch --format "%(refname:short)"  fzf -i -1 --preview 'git log --oneline {}' | xargs git switch
    fi
}

export PATH=$HOME/bin:$HOME/go/bin:$HOME/.cargo/bin:/opt/homebrew/sbin:/opt/homebrew/opt/node@16/bin:/opt/homebrew/bin:$PATH
export EDITOR=vim

export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden"
export FZF_DEFAULT_OPTS="--preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300' --preview-window='right:hidden:wrap' --bind='f2:toggle-preview'"

export SSH_AUTH_SOCK=/Users/haiko/.gnupg/S.gpg-agent.ssh
export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"

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

#defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

alias ll='lsd -la'
alias sweep-cargo='cargo sweep --toolchains $(rustup default | cut -d " " -f 1) -r'

# bun completions
[ -s "/Users/haiko/.bun/_bun" ] && source "/Users/haiko/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
