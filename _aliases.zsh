##############
#  _aliases  #
##############

# ls & nav
##############

# -l: detailed version (access flags, size, owner/group, dates)
# -A: doesn't show '.' or '..'
# -G: colorized output
# -F: also adds type suffix like '/' or '*'
# -O: include file flags, owner and group
# -b: force printing of non-printable characters -> no surprise
# -h: use prefix for file size
alias l='ls -lAGFObh'
# -S: sort by size
alias lsiz='ls -lAGFbhS'
# -@: list extended attributes
alias lext='ls -lAGF0bh@'
# list all XA
alias xat='xattr -l'
# remove all XA
alias xrm='xattr -c'

# Easier navigation: .., ..., and -
alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."
alias ........="cd ../../../../../../.."
alias c="cd"


alias path='tr ":" "\n"<<<"$PATH"'
alias edit='s ~/.zshrc.d'
alias src='source ~/.zshrc'

INS_PATH='/Users/fd/Documents/INS/projet_website_ins/phx-newsite'
alias ins='cd $INS_PATH'

# copy a page in /tmp and open it (prevents JS loading)
function cl() {
  curl $1 > /tmp/new.html && open /tmp/new.html
}


alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

alias asc='man ascii'
alias hex='hexdump -C'
alias bc='bc -l' # -l for floating points results of divisions

calc() { echo "$1" | bc; }

alias tree='tree -aCF --dirsfirst'
function t() {
  if [[ -z $1 ]]; then
    tree -aCFd --dirsfirst
  else
    tree -aCFd -L $1 --dirsfirst
  fi
}

GRAPHICAL_EDITOR="Sublime Text"
# GRAPHICAL_EDITOR="Zed"
function s() {
  if [[ -z $1 ]]
  then
    open . -a $GRAPHICAL_EDITOR
  else
    open $1 -a $GRAPHICAL_EDITOR
  fi
}
alias z="s"

function cal() {
  if [[ -z $1 ]]; then
    ncal -w -y $(date "+%Y")
  else
    ncal -w -y $1
  fi
}

# conversion from UNIX timestamp to human-readable date
function dat() {
    date -r $1
}

alias dco='docker compose'
alias mk='make'

alias flush='dscacheutil -flushcache'
alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'



# ls & size
###############

alias siz='du -mhc -d 1 | gsort -h'
alias nbf='j=`pwd`;for i in `ls -lA | grep ^d | tr -s " " | cut -d" " -f9- | sed "s/ /:;:/g"`;do;k=`echo $i | sed "s/:;:/\\ /g"`;echo -n  "./"${k:0:20}; echo -n "          ";cd $k;find . -type f | wc -l;cd $j;done;echo -n "TOTAL";find . -type f | wc -l'



# rm
########

# move everything to the trash
function rmt() { \mv -i $@ ~/.Trash }
# function rmf() { \rm $@ }
alias emptytrash='\rm -rfv ~/.Trash/* && \rm -rfv ~/.Trash/.*'

# overwrite files 3 times (0xff-0x00-0xff) before deleting them
alias rmsec='\rm -rvP'
alias DS="echo \"Recursively removing all ${COL_YELLOW}.DS_Store${COL_RESET} files...\n\";find . -name '*.DS_Store' -type f -ls -delete"


# search
############

# grep in filenames
function fin() {
  find . -iname "*$1*" | grep -Ii --colour $1
}

function wh() {
  local w=`which $1`
  if [[ $w =~ 'aliased' ]]; then
    echo $w
  elif [[ $w =~ 'not found' ]]; then
    which $w
  elif [[ $w =~ 'built-in' ]]; then
    which $w
  else
    local type=`ls -l \`which  $1\` | cut -b 1` # which -a ?
    # echo $type empty if '-'?
    if [[ $type == "l" ]]; then
      echo -n "${COL_YELLOW}$1 is: ${COL_RESET}"
      which $1
      echo -n "${COL_YELLOW}symlinked to: ${COL_RESET}"
      greadlink -f `which $1`
    else
      echo -n "${COL_PURPLE}$1 is a binary: ${COL_RESET}"
      greadlink -f `which $1`
    fi
  fi
}

# - ag for in-file plain text search
# - rga for in-pdf search


# network, admin & misc
###########################

# get external IP
alias ip="curl ipinfo.io/ip"

function meteo() {
  echo "curling http://wttr.in/$1..."
  curl http://wttr.in/$1
}

function dlm() {
    yt-dlp -o ~/Downloads/new-yt-dl.mp3 --extract-audio --audio-format mp3 --audio-quality 10 $1
}

alias hosts="sudo vim /etc/hosts && sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"

function scan() {
    convert -density 150 $1 -colorspace gray +noise Gaussian -rotate 0.5 -depth 2 tmp.pdf
}

alias serve="python -m http.server 3001"

# Python
#################

alias py='python'
alias lab='jupyter-lab'
# alias format='autopep8 --in-place --aggressive'
alias format='black'
