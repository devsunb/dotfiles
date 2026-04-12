if [[ -z "$TMUX" && ((-n "$SSH_CLIENT" || "$TERM_PROGRAM" == "WezTerm") && -z "$(tmux list-clients 2>/dev/null)") ]]; then exec tmux new -As main; fi

source "$BREW/opt/antidote/share/antidote/antidote.zsh"
antidote load

_evalcache sh "$DOT/zsh/secret.sh"

source "$DOT/zsh/p10k.instant.zsh"
source "$DOT/zsh/p10k.zsh"
source "$DOT/zsh/p10k.custom.zsh"

source "$DOT/zsh/init.zsh"
source "$DOT/zsh/abbr.zsh"

. "$HOME/.cargo/env"
_evalcache atuin init zsh --disable-up-arrow
_evalcache mise activate zsh
_evalcache s5cmd --install-completion
_evalcache zoxide init zsh
_evalcache wt config shell init zsh

if [[ "$OS" == "Mac" ]]; then
  _evalcache mdsf completions zsh
  source ~/.orbstack/shell/init.zsh
  export PATH="$PATH:/Users/sunb/.lmstudio/bin"
fi

alias x="exit"
alias cat="bat"
alias ls="eza --smart-group --time-style long-iso"
alias la="ls --absolute=on"
alias ll="ls -al"
alias l="ls -alo --no-permissions"
alias t="l -T --git-ignore"
alias u="cd -"
alias ..="cd .."
fdh() { fd -HI -E /Library -E /OrbStack -E /.cache -E /go -E '/.*' -E node_modules "$@" ~; }
rgh() { rg -. -g '!Library/' -g '!OrbStack/' -g '!go/' -g '!.*/' -g '!node_modules' "$@" ~; }
ra() { if [[ $# -eq 0 ]]; then cd ~/.Trash; else trash "$@"; fi; }
alias noc="sed 's/\x1B\[[0-9;]\{1,\}[A-Za-z]//g'" # remove color sequences
alias c="sed -z '$ s/\n$//' | pbcopy"
alias p="pbpaste"

alias e="nvim"
alias ee="nvim -i NONE --cmd 'let g:auto_session_enabled = v:false'"
alias o="nvim --cmd 'let g:auto_session_enabled = v:false' -c 'lua open_daily_note()'"
alias ei="ee -c 'diffthis | vs +ene | diffthis | wincmd h'"
alias nvimh="ee -c checkhealth"
alias nvimu="ee '+lua vim.pack.update()'"

alias em="emacsclient"

alias tm="t main"
alias tk='s="$(tmux list-sessions -F "#S" | fzf -e)" && tmux kill-session -a -t "$s"'
alias tt='s="$(tmux list-sessions -F "#S" | fzf -e)" && tmux new -s "$s+" -t "$s" && tmux kill-session -t "$s+"'
alias tp='s="$(ls "$TMUXP" | cut -d. -f1 | fzf -e)" && tmuxp load -y "$TMUXP/$s.yaml" &>/dev/null'
alias tkp='s="$(ls "$TMUXP" | cut -d. -f1 | fzf -e)" && tmux kill-session -t "$s" &>/dev/null; tmuxp load -y "$TMUXP/$s.yaml" &>/dev/null'

alias g="git"
alias ga="git add"
alias gg="lazygit"
alias ggc="git -c gc.reflogExpire=0 -c gc.reflogExpireUnreachable=0 -c gc.rerereresolved=0 -c gc.rerereunresolved=0 -c gc.pruneExpire=now gc"
alias ghb="gh browse"
alias gp="git pull"
alias grao="git remote add origin"
alias grau="git remote add upstream"
alias grso="git remote set-url origin"
alias gs="git status"
alias gu="git push"
alias guf="git push --force-with-lease"

gcl() {
  if [ $# -lt 1 ]; then
    echo "Usage: gcl [git-clone-options] <repository-url>" >&2
    return 1
  fi
  local url="${@: -1}"
  git clone --recurse-submodules -j8 $@ && cd "$(basename -s .git "$url")"
}
alias gcld='gcl --depth 1'
alias gclp='gcl --depth 1 --filter=blob:none --sparse'
