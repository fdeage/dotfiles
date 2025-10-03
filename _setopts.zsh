###########################
#  _setopts & completion  #
###########################

setopt COMPLETEALIASES        # expand aliases when generating completion options for the command line
setopt AUTO_PUSHD             # automatically push the current directory onto the directory stack
setopt PUSHD_IGNORE_DUPS      # no duplicates in dir stack
setopt GLOB_DOTS              # include dot files in globbing
setopt MENU_COMPLETE          # display a list of possible completions in a menu
setopt NOCASEMATCH            # sets pattern matching as case-sensitive

unsetopt BEEP                 # remove the beep when ambiguous completion
unsetopt HIST_BEEP            # remove the beep when accessing non-existing entry
unsetopt RM_STAR_SILENT       # make sure zsh asks for confirmation when rm *

# allow case-insensitive autocomplete
zstyle ':completion:*' matcher-list '' \
 'm:{a-z\-}={A-Z\_}' \
 'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
 'r:|?=** m:{a-z\-}={A-Z\_}'

# automatically load the compinit and promptinit functions when they are used,
# in a clean environment
autoload -Uz compinit promptinit
compinit -i
promptinit
autoload predict-on
