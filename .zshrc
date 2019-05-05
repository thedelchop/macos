export ZSH="$HOME/.oh-my-zsh"
export TERM="xterm-256color"
ZSH_THEME="bullet-train"
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
export UPDATE_ZSH_DAYS=13
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="false"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git) # plugins=(git ssh-agent)
[ -f ~/.ssh/id_rsa ] && ssh-add -K ~/.ssh/id_rsa &> /dev/null
[ -f ~/.ssh/id_ed25519 ] && ssh-add -K ~/.ssh/id_ed25519 &> /dev/null
[ -f ~/.ssh/id_ecdsa ] && ssh-add -K ~/.ssh/id_ecdsa &> /dev/null

# See ~/.oh-my-zsh/custom/themes/bullet-train.zsh-theme
BULLETTRAIN_KCTX_KCONFIG="$HOME/.kube/config"
BULLETTRAIN_PROMPT_ORDER=(
    time
    status
    custom
    dir
    nvm
    ruby
    screen
    git
    cmd_exec_time
)
# https://github.com/guns/xterm-color-table.vim
BULLETTRAIN_NVM_BG="22"
BULLETTRAIN_NVM_FG="7"
BULLETTRAIN_KCTX_BG="19"
BULLETTRAIN_KCTX_FG="7"
source $ZSH/oh-my-zsh.sh

HOMEBREW_PREFIX="/usr/local"
export HOMEBREW_NO_ANALYTICS=1
export MANPATH="/usr/local/man:$MANPATH"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$HOME/bin:$PATH:$HOME/.rvm/bin"
export LD_LIBRARY_PATH="$HOMEBREW_PREFIX/lib:/usr/lib:/lib"
export NVM_DIR="$HOME/.nvm"
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
[ -f "$HOME/.rvm/scripts/rvm" ] && source "$HOME/.rvm/scripts/rvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && source "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && source "/usr/local/opt/nvm/etc/bash_completion"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
ulimit -S -n 2048
