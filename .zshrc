export TLDR_AUTO_UPDATE_DISABLED=1

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=1

export ANTHROPIC_MODEL="claude-3-5-haiku-20241022"
export CLAUDE_CODE_ENABLE_TELEMETRY=0

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

export ERL_AFLAGS="-kernel shell_history enabled -kernel shell_history_file_bytes 1024000"

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

# How is this so slow?

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/fd/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
  if [ -f "/Users/fd/opt/miniconda3/etc/profile.d/conda.sh" ]; then
    . "/Users/fd/opt/miniconda3/etc/profile.d/conda.sh"
  else
    export PATH="/Users/fd/opt/miniconda3/bin:$PATH"
  fi
fi
unset __conda_setup
# <<< conda initialize <<<

conda activate py311
