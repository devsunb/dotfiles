setopt BANG_HIST
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt IGNORE_EOF
setopt INC_APPEND_HISTORY
setopt INTERACTIVE_COMMENTS

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=20000
export TIMEFMT='%J   %U  user %S system %P cpu %*E total'$'
avg shared (code):         %X KB'$'
avg unshared (data/stack): %D KB'$'
total (sum):               %K KB'$'
max memory:                %M KB'$'
page faults from disk:     %F'$'
other page faults:         %R'
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export TZ="Asia/Seoul"
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export LS_COLORS="di=1;34:ln=1;35:so=1;32:pi=1;33:ex=1;31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
# export EDITOR="emacsclient -c"
export EDITOR="nvim"
export VISUAL="$EDITOR"
export PAGER='less -FRX'
# export MANPAGER='sh -c "col -bx | bat -l man -p | less -FRX"'
# export MANPAGER='bat -plman'
export MANPAGER="nvim +Man!"

case "$(uname -s)" in
Darwin) export OS='Mac' ;;
Linux) export OS='Linux' ;;
esac

case "$OS" in
Mac) export BREW="/opt/homebrew" ;;
Linux) export BREW="/home/linuxbrew/.linuxbrew" ;;
esac
