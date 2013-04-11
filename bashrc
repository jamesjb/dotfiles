#
# .bashrc --- Shell initialization file for bash.
#
# Copyright (C) 2001-2013, James Bielman <jamesjb@gmail.com>
# All Rights Reserved.
#

## General Configuration

unset HISTFILE                                  # turn off history file
export EDITOR=vim                               # default text editor
export LSFLAGS="-F -B"                          # default options for ls

# Append a directory to "PATH" if it is not already there.
path_append()
{
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="${PATH:+"$PATH:"}$1"
  fi
}

# Set up a reasonable default PATH.
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

## Interactive Shell Configuration

if [ -n "$PS1" ]; then
  ulimit -c unlimited

  # FIXME: Conditionalize this for Mac OS X and "gls".
  alias ls='ls --color=auto $LSFLAGS'          # alias for color ls
  PS1='[\u@\h \[[1m\]\w\[[0m\]] '

  # If the directory "$HOME/.bashrc.d" exists, source each file
  # within it.  This is used for per-package setup that will vary
  # on different machines.
  if [ -d $HOME/.bashrc.d ]; then
    for f in $HOME/.bashrc.d/*; do
      if [ -r $f ]; then
        source $f
      fi
    done
  fi

  # If the file "$HOME/.bashrc_local" exists, source it.
  if [ -r $HOME/.bashrc_local ]; then
    source $HOME/.bashrc_local
  fi
fi
