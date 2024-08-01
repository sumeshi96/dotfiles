# go
export GOPATH=/usr/local/go
export PATH=$PATH:$GOPATH/bin

# rust
export PATH="$HOME/.cargo/bin:$PATH"
export CARGO_TARGET_DIR="$HOME/.cargo-target"

#ssh  
#eval `ssh-agent -s`
#ssh-add --apple-use-keychain ~/.ssh/gitlab/gitlab_ed25519
#ssh-add --apple-use-keychain ~/.ssh/github/github_ed25519

# git
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

# starship
eval "$(starship init zsh)"

# ls
alias ls=eza
alias ll="eza -al --icons"
alias tree="eza -aT --icons --ignore-glob '.git'"

# cat
alias cat=bat

# od
alias od=hexyl

# find
alias find=fd

# ps
alias procs=ps

# grep
alias grep=rg

# latex
export PATH=/usr/local/texlive/2024/bin/x86_64-linux:$PATH
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# wasmtime
export WASMTIME_HOME="$HOME/.wasmtime"
export PATH="$WASMTIME_HOME/bin:$PATH"

# Alacritty
fpath+=${ZDOTDIR:-~}/.zsh_functions

# no IME
export GTK_IM_MODULE=xim
export QT_IM_MODULE=xim
export XMODIFIERS=@im=none

# zellij
alias zj=zellij
export PATH=$HOME/.local/bin:$PATH
