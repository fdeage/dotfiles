# prevent multi sourcing, reinit SOURCES and make it an array
SOURCES=""
typeset -ga SOURCES

ZSH_CONFIG=~/.zshrc.d
SOURCES+=$ZSH_CONFIG/_aliases.zsh
SOURCES+=$ZSH_CONFIG/_git.zsh
SOURCES+=$ZSH_CONFIG/_history.zsh
SOURCES+=$ZSH_CONFIG/_keys.zsh
SOURCES+=$ZSH_CONFIG/_path.zsh
SOURCES+=$ZSH_CONFIG/_prompt.zsh
SOURCES+=$ZSH_CONFIG/_setopts.zsh
SOURCES+=$ZSH_CONFIG/_various.zsh

# 42 stuff, but usable elsewhere so..
USER=`/usr/bin/whoami`
export $USER
GROUP=`/usr/bin/id -gn $USER`
export $GROUP

for file in `echo $SOURCES`; do
  if [[ -a $file ]]; then
    echo Sourcing `gbasename $file`
    source $file
  else
    echo Could not source `gbasename $file`
  fi
done

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $ZSH_CONFIG/_conda.zsh
echo Sourcing conda done.
