# omz is just better at handling themes
export ZSH="/home/obscurity/.oh-my-zsh"

ZSH_THEME="gallois"

source $ZSH/oh-my-zsh.sh

# Pfetch config
export PF_INFO="title os kernel uptime pkgs memory shell editor palette"
export PF_COL1="1"
export PF_COL2="8"
export PF_COL3="2"

# Startup commands
pfetch

# some gpg shit idk
export GPG_TTY=$(tty)

# aliases
alias cd..="cd .."
alias ls="exa -aFx --icons"
alias la="exa -laFx --icons"
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias src="source ~/.zshrc"
alias reload="sudo systemctl reload"
alias restart="sudo systemctl restart"
alias start="sudo systemctl start"
alias stop="sudo systemctl stop"
alias logs="sudo journalctl -u"
alias fd="fdfind"
alias install="sudo apt install -y"
alias update="sudo apt update -y"
alias upgrade="sudo apt upgrade -y"
alias svim="sudo -E vim"
alias dotfiles='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# Antigen
source ~/zsh-stuff/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle sudo
antigen bundle thefuck
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-autosuggestions

antigen apply
