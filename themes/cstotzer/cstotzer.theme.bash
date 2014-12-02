#!/usr/bin/env bash

THEME_COLOR="${yellow}"

SCM_THEME_PROMPT_PREFIX="${white}"
SCM_THEME_PROMPT_SUFFIX="${THEME_COLOR} | "
SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_CLEAN=" ${green}✓"

echo "black: ${black}"
echo "red: ${red}"
echo "green: ${green}"
echo "yellow: ${yellow}"
echo "blue: ${blue}"
echo "purple: ${purple}"
echo "cyan: ${cyan}"
echo "white: ${white}"
echo "orange: ${orange}"
echo "bold_black: ${bold_black}"
echo "bold_red: ${bold_red}"
echo "bold_green: ${bold_green}"
echo "bold_yellow: ${bold_yellow}"
echo "bold_blue: ${bold_blue}"
echo "bold_purple: ${bold_purple}"
echo "bold_cyan: ${bold_cyan}"
echo "bold_white: ${bold_white}"
echo "bold_orange: ${bold_orange}"

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
