# Sets PS1 prompt
export PS1="\W$\[$(tput sgr0)\]"

# Setting up the default editor
export EDITOR='vim'

# Don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# Leave some commands out of history log
export HISTIGNORE="&:??:?:[ ]*:clear:exit:logout:pwd"

# Command Aliases
alias ls='ls -G'
alias ll='ls -la'
alias h='history'

# Setting the color for ls
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Support 256 colors
export TERM="xterm-256color"

# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/usr/local/Cellar:/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH
