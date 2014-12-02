#!/usr/bin/env bash

THEME_COLOR="${yellow}"

SCM_THEME_PROMPT_PREFIX="${white}"
SCM_THEME_PROMPT_SUFFIX="${THEME_COLOR} | "
SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_CLEAN=" ${green}✓"

function symbol() {
	if [ "$(id -u)" == "0" ] ; then
		echo "# "
	else 
		echo "$ "
	fi
}

function virtualenv_prompt() {
  if [ ! -z "$VIRTUAL_ENV" ]
  then
    echo "[${VIRTUAL_ENV##*/}] "
  fi
}

function ssh_prompt() {
  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    if [ "$(id -un)" == "cstotzer" ]; then
      echo "\h:"
    else 
      echo "\u@\h:"
    fi
  else 
    if [ "$(id -un)" != "cstotzer" ]; then
      echo "\u:"
    fi
  fi
}

prompt() {
  PS1="${bold_black}$(virtualenv_prompt)$(scm_prompt_info)${bold_white}${reset_color}${THEME_COLOR}$(ssh_prompt)\w $(symbol)${reset_color}"
}

PROMPT_COMMAND=prompt
