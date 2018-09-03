# ZSH Theme - Preview: http://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[bold]$fg[red]%}%n@%m%{$reset_color%}'
# TODO Below is not a good solution. Should refactor it later.
# Suggestion is to compile all these files first.
elif [ $HOST = 'FrankMbp.local' ] || [ $HOST = 'MacBook-Air' ]; then
    local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
else
  local user_host='%{$terminfo[bold]$fg[yellow]%}%n@%m%{$reset_color%}'
  fi

local current_dir='%{$terminfo[bold]$fg[blue]%} %~%{$reset_color%}'

local git_branch='$(git_prompt_info)%{$reset_color%}'

PROMPT="╭─${user_host} ${current_dir} ${git_branch}
╰─λ "
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
