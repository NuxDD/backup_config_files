# open a base session by default on tmux
if type tmux > /dev/null; then;
	if [ -z "$TMUX" ]; then
		tmux attach -t base || tmux new -s base
	fi
fi

# auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
unsetopt AUTO_REMOVE_SLASH

# vim mode
# https://unix.stackexchange.com/questions/370663
# https://unix.stackexchange.com/questions/547
bindkey -v
export KEYTIMEOUT=1

# this would lead to be unable to write hjkl while completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' #
preexec() { echo -ne '\e[5 q' ;}

# Set the bind Ctrl-e to edit a command line with vim 
# (usefull to edit with 'ct)'-like commands)
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Alias section
alias ls="ls -Ahl --color=auto"
alias ...="cd ../.."
alias ....="cd ../../.."
alias reload="source ~/.zshrc"

alias colorcode='for i in {0..50}; do for j in {0..5}; do code=$((i*5+j)); echo -ne "\e[38;05;${code}m $code - color"; done; echo; done'

alias commit="git commit"
alias add="git add"
alias gs="git status --short"
alias push="git push"
alias diff="git diff --color"

export EDITOR="vim"
export PATH="/usr/local/bin:$PATH"
export PROMPT="%F{8}%B{%T}>%b%f %F{40}%n%f %B%F{8}at%f%b %F{40}%d%f"$'\n'"$ "

# enable the X display on Windows with the Xserv software (only for WSL2)
if grep -q Microsoft /proc/version; then
	export DISPLAY=localhost:0.0 
fi

#load the syntax highlighting
source /usr/share/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null
