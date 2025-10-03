#################
#  _prompt      #
#################

TIME_COLOR="%F{6}"
USER_COLOR="%F{30}"
DIR_COLOR="%F{14}"
RESET="%f"

PROMPT="${TIME_COLOR}%* ${USER_COLOR}%n ${DIR_COLOR}%(4~|%-1~/.../%2~|%3~)${RESET} $> "

# # Enable substitution in the prompt.
setopt PROMPT_SUBST

# Autoload zsh add-zsh-hook and vcs_info functions (-U autoload w/o substition, -z use zsh style)
autoload -Uz add-zsh-hook vcs_info
# Run vcs_info just before a prompt is displayed (precmd)
add-zsh-hook precmd vcs_info
# add ${vcs_info_msg_0} to the prompt
# e.g. here we add the Git information in red
RPROMPT='%F{red}${vcs_info_msg_0_}%f'


# Enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true
# Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
# Set the format of the Git information for vcs_info
zstyle ':vcs_info:git:*' formats       '(%b%u%c)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'
