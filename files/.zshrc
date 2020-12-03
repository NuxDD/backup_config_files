# Zsh options
unsetopt AUTO_REMOVE_SLASH

# Alias section
alias ls="ls -al"
alias ...="cd ../.."
alias ....="cd ../../.."
alias reload="source ~/.zshrc"

alias commit="git commit"
alias add="git add"
alias gs="git status --short"
alias push="git push"

export EDITOR="vim"
export PATH="/usr/local/bin:$PATH"
export PS1="{\A}>@ \w\n\\$\[$(tput sgr0)\]"
