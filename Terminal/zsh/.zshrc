# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
ZSH_THEME="sunrise"

# Enable plugins (e.g., git, zsh-autosuggestions, zsh-syntax-highlighting)
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Additional settings:
HIST_STAMPS="mm/dd/yyyy"
export UPDATE_ZSH_DAYS=14
export DISABLE_UPDATE_PROMPT=true

# Aliases
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'

# Custom functions
function extract() {
  if [ -f $1 ]; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)           echo "don't know how to extract '$1'..." ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# For zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=11"

# For zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# Custom alias for reload .zshrc
alias reloadzsh="source ~/.zshrc"

# Custom Zsh Theme for Programmer and Cybersecurity Professional
prompt_custom_theme() {
    local user_color="%F{green}"
    local directory_color="%F{blue}"
    local git_branch_color="%F{yellow}"
    local normal="%f%b"

    # User and Host information
    local user_host="${user_color}%n@%m${normal}"

    # Current working directory
    local current_directory="${directory_color}%~${normal}"

    # Git branch and status
    local git_branch='$(git_prompt_info)'
    ZSH_THEME_GIT_PROMPT_PREFIX="(${git_branch_color}"
    ZSH_THEME_GIT_PROMPT_SUFFIX="${normal})"
    ZSH_THEME_GIT_PROMPT_CLEAN=""
    ZSH_THEME_GIT_PROMPT_DIRTY="%F{red}*${normal}"

    # Construct the prompt
    PROMPT="${user_host} ${current_directory} ${git_branch} %# "
}

# Load custom theme
prompt_custom_theme

# Setting for the custom theme
autoload -Uz colors && colors
autoload -Uz add-zsh-hook
add-zsh-hook precmd prompt_custom_theme

# Network Information in Prompt
prompt_ip_info() {
    local ip=$(ip a | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | cut -d/ -f1 | head -n 1)
    echo "%F{cyan}$ip%F{white}"
}
PROMPT+='$(prompt_ip_info) '

# Enhanced 'ls' Aliases
alias ls='ls --color=auto'

# Quick Access to Common Directories
alias docs='cd ~/Documents'
alias dloads='cd ~/Downloads'

# Enhanced 'grep'
alias grep='grep --color=auto'

# Shortcut for 'sudo'
alias please='sudo $(fc -ln -1)'

# Directory Stack Controls
alias dirs='dirs -v' 
alias 1='cd -' 

# Git Aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'

# Custom Function for Making and Entering Directory
mkcd() { mkdir -p "$@" && cd "$_"; }

