#################
#  _git         #
#################

# No arguments: `git status`
# With arguments: acts like `git`
function g() {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status -sb
  fi
}

alias tig='tig --all --word-diff'
alias gp='git push'
alias ga='git add'
alias gau='git add -u' # add only modifs on tracked files
alias gap='git add -p' # interactive, partial add
alias gam='git commit --amend --no-edit'

alias pulls='for f in *; do (cd $f && echo $f && git pull); done'

function gcm() {
  if [[ -z $1 ]]; then
    git commit -m "MBA: auto commit"
  else
    git commit -m $1
  fi
}

function sta() {
  if [[ -z $1 ]]; then
    git stash show -p
  else
    git stash show -p stash@{$1}
  fi
}
