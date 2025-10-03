#################
#  _history     #
#################

HISTSIZE=SAVEHIST=10000000

# setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS    # Keep only one instance of each, even if not consecutive
setopt HIST_SAVE_NO_DUPS       # Save only new commands
setopt INC_APPEND_HISTORY      # Add commands as they are typed, don't wait until shell exit
setopt SHARE_HISTORY           # If several zsh instances are run
setopt HIST_IGNORE_SPACE       # Commands beginning with space are not stored in history
setopt HIST_REDUCE_BLANKS      # Remove superfluous blanks from each command line
                               # being added to the history list
setopt EXTENDED_HISTORY        # Keep the beginning timestamp
setopt HIST_NO_FUNCTIONS       # remove function definitions from the history


HISTFILE=~/.zsh_history

alias chis="cat $HISTFILE | LC_ALL=C uniq | grep -Ii --colour $2" #$> chis test -> show reference to test (case-insensitive, no binary file searched)
alias lis="tail -r -1000 $HISTFILE | cat -n | gawk -F '[:;]' '{print \$1 strftime(\"%c\", \$2) \"  \" \$4 }' | less"
alias rmhis="rm $HISTFILE"
alias eis="vim $HISTFILE"
