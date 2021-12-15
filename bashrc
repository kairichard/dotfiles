# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

if [ -f $HOME/.bashrc.local ]; then
    source $HOME/.bashrc.local
fi

PLATTFROM=$(uname|tr [:upper:] [:lower:])

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=20000
HISTFILESIZE=20000

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    	# We have color support; assume it's compliant with Ecma-48
	    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    	# a case would tend to support setf rather than setaf.)
	    color_prompt=yes
        source ~/.bash/colors
    else
	    color_prompt=
    fi
fi
if [ "$color_prompt" = yes ]; then
    PS1="$Bold$Cyan\u$NC$White on $Pink\h$NC$White in $Brown\w$NC\$(git_info_ps1)\n>> "
else
    PS1='\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

eval "$(/opt/homebrew/bin/brew shellenv)"

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

if [ -f ~/git/git-completion.bash ]; then
    . ~/git/git-completion.bash
fi

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi
if [ -f /etc/profile.d/autojump.bash ]; then
    . /etc/profile.d/autojump.bash
fi


for file in `ls  $HOME/.bash/`; do
  [[ -f $HOME/.bash/$file ]] && source $HOME/.bash/$file;
done

# include plattform specifics at last to give change to override certain things
source ~/.bash/plattforms/$PLATTFROM

# APPEND PATHS AT THE END
export PATH="$HOME/.bash/bin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

active_plugins=("rbenv" "direnv" "pyenv" "nodenv", "nnn")

for plugin in ${active_plugins[@]}; do
  [[ -f $HOME/.bash/plugins/$plugin ]] && source $HOME/.bash/plugins/$plugin;
done


# Added by lace dev-dotfiles
if [ -f $HOME/.bashrc.bis.dev ]; then
   source $HOME/.bashrc.bis.dev
fi

if [ -f $HOME/.bis.profile ]; then
   source $HOME/.bis.profile
fi

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
export PATH=/Users/kkoenig/.local/bin:$PATH

# HSTR configuration - add this to ~/.bashrc
alias hh=hstr                    # hh to be alias for hstr
export HSTR_CONFIG=hicolor       # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=20000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# ensure synchronization between Bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color
