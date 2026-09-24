# PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ ) %{$fg[cyan]%}%1~%{$reset_color%}"
PROMPT="%(?:%{$fg_bold[green]%}%m :%{$fg_bold[red]%}%m )%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ ) %{$fg[cyan]%}%~%{$reset_color%}"
PROMPT+=' $(git_prompt_info)'
PROMPT+=$'\n'
PROMPT+='%(?:%{$fg_bold[green]%}%B» %b:%{$fg_bold[red]%}%B» %b)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
