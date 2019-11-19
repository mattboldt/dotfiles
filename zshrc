# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="TheOne"
# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  github
  zsh_reload
  yarn
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# export PATH="$(brew --prefix qt@5.5)/bin:$PATH"

if [ -d "$HOME/bin" ] ; then
  PATH="$PATH:$HOME/bin"
fi

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# --------------------------
# Prompt
# --------------------------
function precmd () {
  window_title="\033]0;${PWD##*/}\007"
  echo -ne "$window_title"
}
autoload precmd

NEWLINE=$'\n'
# Git prompt plugin
source ~/.dotfiles/zsh-git-prompt/zshrc.sh
ZSH_THEME_GIT_PROMPT_SEPARATOR=""
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_STAGED=" %{$fg[red]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS=" %{$fg[red]%}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED=" %{$fg[blue]%}%{✚%G%}"
PROMPT='%{$fg_bold[green]%}%p%{$fg_bold[blue]%}%c %{$fg_bold[white]%}| $(git_super_status)% %{$reset_color%}${NEWLINE}%{$fg_bold[magenta]%}λ %{$reset_color%}'
# fpath=(/usr/local/share/zsh-completions $fpath) idk?
echo -e "\033]6;1;bg;red;brightness;40\a"
echo -e "\033]6;1;bg;green;brightness;44\a"
echo -e "\033]6;1;bg;blue;brightness;52\a"

# --------------------------
# Aliases
# --------------------------
alias title="printf '\033]0;%s\007'"
alias flushdns="sudo killall -HUP mDNSResponder"
alias zshinstall="./install && zsh"

# --------------------------
# Alias: MySQL
# --------------------------
alias mysql_start="brew services start mysql@5.7"
alias mysql_stop="brew services stop mysql@5.7"

# --------------------------
# Alias: Rails
# --------------------------
alias rpsec="rspec"
alias rsepc="rspec"
alias srpec="rspec"
alias migrate="rake db:migrate RAILS_ENV=development"
alias migrate_t="rake db:migrate RAILS_ENV=test"
alias _rails="rails s -b 127.0.0.1"
alias ams="_rails -p 3003"
alias rails_42="BUNDLE_GEMFILE=Gemfile_rails_4_2"
alias rails_d="BUNDLE_GEMFILE=Gemfile"
alias vendor="_rails -p 3005"
alias storefront="_rails -p 3001"
alias orcs="_rails -p 4000"
alias order_service="_rails -p 3009"
alias events="_rails -p 3006"

# --------------------------
# Alias: Git
# --------------------------
alias g="git up"
alias s="git status"
alias got="git"
alias gut="git"

# --------------------------
# Alias: Docker
# --------------------------
alias dc="docker-compose"
alias dcl="docker-compose logs -f --tail=1000"
alias dckill="docker-compose down -v --rmi all"
alias dps="docker ps"
alias da="docker attach"
alias droutes="./script/exec bin/rake routes"
alias drails="./script/restart_rails"

# --------------------------
# MySQL
# --------------------------
export PATH=${PATH}:/usr/local/mysql/bin
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

export PATH=${PATH}:/usr/local/bin

# --------------------------
# Cargo
# --------------------------
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$HOME/.cargo/env"

# --------------------------
# NVM
# --------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# --------------------------
# Term
# --------------------------
if [[ $TERM == xterm ]]; then
  TERM=xterm-256color
fi

# --------------------------
# Yarn
# --------------------------
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# --------------------------
# Openssl
# --------------------------
export PATH="/usr/local/opt/openssl/bin:$PATH"

# --------------------------
# Wasmer
# --------------------------
export WASMER_DIR="$HOME/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"  # This loads wasmer

# --------------------------
# libiconv
# --------------------------
export LDFLAGS="-L/usr/local/opt/libiconv/lib"
export CPPFLAGS="-I/usr/local/opt/libiconv/include"

# --------------------------
# RVM
# --------------------------
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
