[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

setopt SHARE_HISTORY
setopt extended_glob

if [[ $(uname) = "Darwin" ]]; then
	fpath=($HOME/dotfiles/zsh/completions /opt/homebrew/share/zsh/site-functions $fpath)
else
	fpath=($HOME/dotfiles/zsh/completions $fpath)
fi

autoload -Uz compinit
compinit -u

HISTFILE=$HOME/.zhistory
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

# A function to interactively open a chain in your Browser
# (cargo install subrpc)
# Simply call `sub` or `sub <pattern>`
function sub() {
    chains=$(subrpc reg chains)

    if [ ! -z "$1" ]; then
        query="$1"
        echo "Searching for chains matching: $query"
        chain=$(echo "$chains" | sort -r | fzf -1 -q "$query" --prompt="Select the chain to open in your browser > ")
    else
        chain=$(echo "$chains" | sort -r | fzf -1 --prompt="Select the chain to open in your browser > ")
    fi
    subrpc endpoints open "$chain"
}

export EDITOR=vim

export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden"
export FZF_DEFAULT_OPTS="--preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300' --preview-window='right:hidden:wrap' --bind='f2:toggle-preview'"

#export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh

#export ORT_DATA_DIR=$HOME/nobackup/ort_data
#export ORT_CONFIG_DIR=$HOME/.ort/config

if [[ $(uname) == "Darwin" ]]; then
    export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"
    export PATH=/opt/homebrew/opt/gawk/libexec/gnubin:/opt/homebrew/sbin:/opt/homebrew/opt/node@16/bin:/opt/homebrew/bin:$PATH
#    export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"

#    source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
#    source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

    # set default search scope in finder to current folder
    defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
fi

#export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export PATH=$HOME/bin:$HOME/go/bin:$HOME/.cargo/bin:$PATH

bindkey -e
source $HOME/dotfiles/vendor/fzf/completion.zsh
source $HOME/dotfiles/vendor/fzf/key-bindings.zsh

[[ -f $HOME/.creds.zsh ]] && source $HOME/.creds.zsh

if [[ "$TERMINAL_EMULATOR" == "JetBrains-JediTerm" ]]; then
  bindkey "∫" backward-word # Option-b
  bindkey "ƒ" forward-word  # Option-f
  bindkey "∂" delete-word   # Option-d
fi

# bun
if [[ -s "${HOME}/.bun/_bun" ]]; then
    source "${HOME}/.bun/_bun"
    export BUN_INSTALL="$HOME/.bun"
    export PATH="$BUN_INSTALL/bin:$PATH"
fi

alias ll='lsd -la'
alias sweep-cargo='cargo sweep --toolchains $(rustup default | cut -d " " -f 1) -r'

alias gib-grafana='kubectl --namespace monitoring port-forward svc/prom-stack-grafana 3000:80'
alias gib-prometheus='kubectl -n monitoring port-forward svc/prom-stack-kube-prometheus-prometheus 9090:9090'

# bun completions
#[ -s "/Users/haiko/.bun/_bun" ] && source "/Users/haiko/.bun/_bun"

