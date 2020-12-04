# Zsh misc options
unsetopt AUTO_REMOVE_SLASH

# History setup
HISTFILE=~/.cache/zsh/history
HISTSIZE=10000 
SAVEHIST=10000 

# Set the bind Ctrl-e to edit a command line with vim 
# (usefull to edit with 'ct)'-like commands)
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Alias section
alias ls="ls -Al --color=auto"
alias ...="cd ../.."
alias ....="cd ../../.."
alias reload="source ~/.zshrc"

alias colorcode='for i in {0..50}; do for j in {0..5}; do code=$((i*5+j)); echo -ne "\e[38;05;${code}m $code - color"; done; echo; done'

alias commit="git commit"
alias add="git add"
alias gs="git status --short"
alias push="git push"

export EDITOR="vim"
export PATH="/usr/local/bin:$PATH"
export PROMPT="%F{8}%B{%T}>%b%f %F{40}%n%f %B%F{8}at%f%b %F{40}%d%f"$'\n'"$ "

#enable the X display on Windows with the Xserv software (only for WSL2)
if grep -q Microsoft /proc/version; then
	export DISPLAY=localhost:0.0 
fi


