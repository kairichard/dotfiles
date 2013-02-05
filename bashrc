# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

PLATTFROM=$(uname|tr [:upper:] [:lower:])

source ~/.bash/plattforms/$PLATTFROM

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

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
    PS1="$Green\u@\h$NC::$Brown\w$NC\$(svn_info_ps1)\$(git_info_ps1)\n>> "
else
    PS1='\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt


if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if [ -f ~/git/git-completion.bash ]; then
    . ~/git/git-completion.bash 
fi

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi
if [ -f /etc/profile.d/autojump.bash ]; then
    . /etc/profile.d/autojump.bash
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.


for file in `ls  $HOME/.bash/`; do 
  [[ -f $HOME/.bash/$file ]] && source $HOME/.bash/$file;
done

# APPEND PATHS AT THE END
export PATH="$HOME/.bash/bin:$PATH"
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
