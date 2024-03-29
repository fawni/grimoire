# Source profile
source ~/.profile

# Colors for prompt
autoload -U colors && colors

# Pfetch config
export PF_INFO="title os kernel uptime pkgs memory shell editor palette"
export PF_COL1="1"
export PF_COL2="8"
export PF_COL3="2"

# Set vim as default editor
export EDITOR="vim"

# Startup commands
pfetch

# Some gpg stuff idk
export GPG_TTY=$(tty)

# Better commands history
export HISTFILE=~/.histfile
export HISTSIZE=1000000   # the number of items for the internal history list
export SAVEHIST=1000000   # maximum number of items for the history file

# The meaning of these options can be found in man page of `zshoptions`.
setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time

# Aliases
alias cd..="cd .."
alias ls="exa -aFx --icons  --group-directories-first"
alias la="exa -laF --icons  --group-directories-first"
alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"
alias src="source ~/.zshrc"
alias reload="sudo systemctl reload"
alias restart="sudo systemctl restart"
alias start="sudo systemctl start"
alias stop="sudo systemctl stop"
alias logs="sudo journalctl -u"
alias fd="fdfind -H"
alias bat="batcat"
alias install="sudo apt install -y"
alias update="sudo apt update -y"
alias upgrade="sudo apt upgrade -y"
alias remove="sudo apt remove"
alias autoremove="sudo apt remove"
alias apt="sudo apt"
alias svim="sudo -E vim"
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias sysctl="sudo systemctl"

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

## Zinit

# Prompt theme
setopt promptsubst

zinit ice wait'!0'
zinit light x6r/gal

# Plugins
zinit ice wait lucid
zinit light zsh-users/zsh-history-substring-search
zinit ice wait lucid
zinit light zdharma-continuum/fast-syntax-highlighting
zinit ice wait lucid
zinit light zsh-users/zsh-completions
zinit ice wait lucid
zinit light zsh-users/zsh-autosuggestions
# zinit ice wait lucid
# zinit light zdharma-continuum/history-search-multi-word

# Omz libs
zinit ice wait lucid
zinit snippet OMZL::git.zsh
zinit ice wait lucid
zinit snippet OMZL::completion.zsh

# Omz plugins
zinit ice wait lucid
zinit snippet OMZP::git
zinit ice wait lucid
zinit snippet OMZP::thefuck
zinit ice wait lucid
zinit snippet OMZP::sudo
zinit ice wait lucid
zinit snippet OMZP::command-not-found
zinit ice wait as'completion' lucid
zinit snippet OMZ::plugins/docker/_docker
zinit ice wait as'completion' lucid
zinit snippet OMZ::plugins/docker-compose/_docker-compose
zinit ice wait lucid
zinit snippet OMZP::docker-compose

# Atuin
export ATUIN_NOBIND="true"
zinit light ellie/atuin
bindkey '^r' _atuin_search_widget

# auto-completion
autoload -Uz compinit
compinit
